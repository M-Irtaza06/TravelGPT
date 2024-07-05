import streamlit as st
import util.io as io
import RAG as rag

# Initialize Streamlit app
def main():
    st.title("RAG Example with Streamlit")

    st.header("Input Data")
    customer_id = st.text_input("Customer ID", "CUSTOMER000000000001")
    jentalk_room_id = st.text_input("Jentalk Room ID", "ROOM0000000000000001")
    create_date = st.text_input("Create Date", "2024-06-01 12:34:56")
    travel_start_date = st.date_input("Travel Start Date", value=None)
    travel_end_date = st.date_input("Travel End Date", value=None)
    traveler_count = st.number_input("Traveler Count", min_value=1, value=5)
    include_child = st.selectbox("Include Child", options=["Y", "N"], index=0)
    include_elder = st.selectbox("Include Elder", options=["Y", "N"], index=1)
    include_wheelchair = st.selectbox("Include Wheelchair", options=["Y", "N"], index=0)
    travel_style = st.text_input("Travel Style", "흥미진진한,자연과 함께하는")
    spot_count = st.number_input("Spot Count", min_value=1, value=8)
    spot_type = st.text_input("Spot Type", "바다,섬,오름")
    spots = st.text_input("Spots", "성산일출봉,함덕해수욕장,우도")
    title = st.text_input("Title", "가족들과 추억쌓기")
    contents = st.text_area("Contents", "사랑하는 가족들과 즐거운 추억쌓고 싶네요~")

    # Collect input data into a dictionary
    input_example = {
        "customer_id": customer_id,
        "jentalk_room_id": jentalk_room_id,
        "create_date": create_date,
        "travel_start_date": str(travel_start_date) if travel_start_date else "",
        "travel_end_date": str(travel_end_date) if travel_end_date else "",
        "traveler_count": traveler_count,
        "include_child": include_child,
        "include_elder": include_elder,
        "include_wheelchair": include_wheelchair,
        "travel_style": travel_style,
        "spot_count": spot_count,
        "spot_type": spot_type,
        "spots": spots,
        "title": title,
        "contents": contents
    }

    if st.button("Run RAG"):
        rag_input = io.format_rag_input(input_example)
        rag_input = io.dictionary_to_natural_query(rag_input)
        
        try:
            result1 = rag.JSON_RAG(rag_input)
            result2 = rag.WebSearch_RAG(rag_input)
            
            if not result2:
                st.error("No results found in WebSearch_RAG. Please check your input.")
            else:
                output_result = io.merge_reform(result1, result2)

                st.header("Results")
                st.subheader("RAG JSON Result")
                st.write(result1)

                st.subheader("RAG Web Search Result")
                for item in result2.items():
                    st.write(item)
                
                st.subheader("Merged Result")
                st.write(output_result)
        except Exception as e:
            st.error(f"An error occurred: {e}")

if __name__ == "__main__":
    main()