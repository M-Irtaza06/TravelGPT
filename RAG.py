import os, json
from langchain_openai import ChatOpenAI
from langchain_openai import OpenAIEmbeddings
from langchain_core.runnables import RunnablePassthrough
from langchain_community.vectorstores import FAISS
from langchain_community.vectorstores.utils import DistanceStrategy
from langchain.docstore.document import Document
from langchain_core.output_parsers import JsonOutputParser
from langchain_core.prompts import PromptTemplate
import util.output_format as output_format
from langchain_community.vectorstores import Chroma
from langchain_google_community import GoogleSearchAPIWrapper
from langchain_community.retrievers.web_research import WebResearchRetriever
from langchain.chains import RetrievalQAWithSourcesChain

os.environ["OPENAI_API_KEY"] = "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"
os.environ["GOOGLE_CSE_ID"] = "6376ed1064ed646a4"
os.environ["GOOGLE_API_KEY"] = "AIzaSyBV2Bm0r5S_Zn9FUpjz2alaDiQDTgpI6QM"   

embedding_function = OpenAIEmbeddings(deployment='gpt-4-32k')
import langchain
#langchain.debug = True # Print prompt

def load_json(file_path):
    
    with open(file_path, 'r', encoding='utf-8') as f:
        return json.load(f)

def format_docs(docs):
    rst = ''
    for i, doc in enumerate(docs):
        doc.page_content = doc.page_content.replace('\n', ', ')
        rst += f'{i+1}. {doc.page_content} , source:\n {doc.metadata["source"]}\n' 
    return rst

def JSON_RAG(query, language='한국어'):
    
    documents = []
    for file in os.listdir('./json/'):
        if file.endswith('.json'):
            data = load_json(f'./json/{file}')

            for item in data:
                page_content = ''
                source = ''
                for key in item:
                    if 'id' not in key:
                        page_content += key + ':' + str(item[key]) + '\n'
                    else:
                        source = item[key]
                documents.append(Document(page_content=page_content, metadata={"source": source}))
            
    db = FAISS.from_documents(documents,
                                   embedding = embedding_function,
                                   distance_strategy = DistanceStrategy.COSINE
                                  )
    
    docs = db.similarity_search(query)

    parser = JsonOutputParser(pydantic_object=output_format.Output)

    template = """Answer the question based only on the following context:
    <CONTEXT>{context}</CONTEXT>
    <QUESTION>{question}</QUESTION>
    <FORMAT_INSTRUCTION>{format_instructions}</FORMAT_INSTRUCTION>
    """
    prompt = PromptTemplate(
        template=template,
        input_variables=["question"],
        partial_variables={"format_instructions": parser.get_format_instructions()})

    #prompt = ChatPromptTemplate.from_template(template)
    llm = ChatOpenAI(model='gpt-4o')
    docs = format_docs(docs)
    chain = (
        {"context": lambda x: docs, "question": RunnablePassthrough()}
        | prompt
        | llm
        | parser #StrOutputParser() 대신 이거 쓴다.
    )
    question = 'CONTEXT를 이용하여 여행지, 호텔, 맛집, 렌터카 등 여행정보를 알려주세요.\
          친절하게 설명해주세요. 언어는 다음 언어를 사용해주세요. : %s' % language
    return chain.invoke(question)   


def WebSearch_RAG(query, language='한국어'):
    # LLM
    llm = ChatOpenAI(model='gpt-4o')
    # Vectorstore 
    vectorstore = Chroma(embedding_function=embedding_function)

    # Search
    search = GoogleSearchAPIWrapper()

    # Retriever
    web_research_retriever = WebResearchRetriever.from_llm(
        vectorstore=vectorstore,
        llm=llm,
        search=search,
        )

    # Initialize question-answering chain with sources retrieval
    parser = JsonOutputParser(pydantic_object=output_format.Output)

    template = """Answer the question with summaries
        <SUMMARIES>{summaries}</SUMMARIES>
        <QUESTION>{question}</QUESTION>
        <FORMAT_INSTRUCTION>{format_instructions}</FORMAT_INSTRUCTION>
        """
    prompt = PromptTemplate(
        template=template,
        input_variables=["summaries", "question"],
        partial_variables={"format_instructions": parser.get_format_instructions()})
    
    chain_type_kwargs = {"prompt": prompt}

    chain = RetrievalQAWithSourcesChain.from_chain_type(llm=llm,
                                                        retriever=web_research_retriever,
                                                        chain_type_kwargs=chain_type_kwargs)

    question = query+ '\n주어진 정보를 이용하여 제주도 여행지, 호텔, 맛집, 렌터카 등 여행정보를 알려주세요.\
          친절하게 설명해주세요. 언어는 다음 언어를 사용해주세요. : %s' % language
    result =  chain.invoke(question)  
    #json string to dictionary
    jsonstring = result['answer'].replace("```json", "").replace("```", "")
    return json.loads(jsonstring)








