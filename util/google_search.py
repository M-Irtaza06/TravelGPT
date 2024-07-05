import os

os.environ["GOOGLE_CSE_ID"] = "6376ed1064ed646a4"
os.environ["GOOGLE_API_KEY"] = "AIzaSyBV2Bm0r5S_Zn9FUpjz2alaDiQDTgpI6QM"   

from langchain_google_community import GoogleSearchAPIWrapper
from langchain_core.tools import Tool

search = GoogleSearchAPIWrapper()


def top_results(query):
    return search.results(query, 10)

tool = Tool(
    name="Google Search Snippets",
    description="Search Google for recent results.",
    func=top_results,
)

def gsearch(question):
    print('debug', question)
    search_result = tool.run(question)
    return search_result

if __name__ == '__main__':
    search_result = gsearch('how to make a cake')
    print(search_result, type(search_result))