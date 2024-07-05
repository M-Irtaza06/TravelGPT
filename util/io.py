from ast import literal_eval

def format_rag_input(input_data):
    converted_data = {
    'Number of Traveler': input_data['traveler_count'],
    'Include Child': input_data['include_child'],
    'Include Elder': input_data['include_elder'],
    'Include Wheelchair': input_data['include_wheelchair'],
    'Travel Style': input_data['travel_style'],
    'Number of Spot': input_data['spot_count'],
    'Places Type': input_data['spot_type'],
    'Essential Places to be included': input_data['spots'],
    'Goal': input_data['title'],
    'Request': input_data['contents']
    }
    return converted_data

def dictionary_to_natural_query(query_dict):
    query = f"""
        여행자 수는 {query_dict['Number of Traveler']}명이고, 
        어린이 포함 여부는 {'예' if query_dict['Include Child'] == 'Y' else '아니오'}, 
        노인 포함 여부는 {'예' if query_dict['Include Elder'] == 'Y' else '아니오'}, 
        휠체어 포함 여부는 {'예' if query_dict['Include Wheelchair'] == 'Y' else '아니오'}입니다. 
        여행 스타일은 {query_dict['Travel Style']} 스타일입니다. 
        여행지의 개수는 {query_dict['Number of Spot']}개이며, 
        여행지 유형으로는 {query_dict['Places Type'].replace(',', ', ')}을 포함합니다. 
        필수 포함 여행지로는 {query_dict['Essential Places to be included'].replace(',', ', ')}가 있습니다. 
        여행의 목표는 {query_dict['Goal']}입니다. 
        {query_dict['Request']}
        """
    return query.strip()

def merge_reform(dbresult, webresult):
    recommendations = {'prompt': dbresult['prompt']}
    for result in [dbresult, webresult]:
        for i in range(len(result['name'])):
            entry = {
                "name": result["name"][i],
                "tel": result["tel"][i],
                "address": result["address"][i],
                "category": result["category"][i],
                "explanation": result["explanation"][i],
                "source" : result['source'][i]
            }
            recommendations.setdefault(result['item_type'][i], []).append(entry)            
    return recommendations

if __name__ == "__main__":

    # Example usage:
    input_example = {
            "customer_id" : "CUSTOMER000000000001",
            "jentalk_room_id" : "ROOM0000000000000001",
            "create_date" : "2024-06-01 12:34:56",
            "travel_start_date" : "2024-06-12",
            "travel_end_date" : "2024-06-18",
            "traveler_count" : 5,
            "include_child" : "Y",
            "include_elder" : "N",
            "include_wheelchair" : "Y",
            "travel_style" : "흥미진진한,자연과 함께하는",
            "spot_count" : 8,
            "spot_type" : "바다,섬,오름",
            "spots" : "성산일출봉,함덕해수욕장,우도",
            "title" : "가족들과 추억쌓기",
            "contents" : "사랑하는 가족들과 즐거운 추억쌓고 싶네요~"
    }
            

    rag_input = format_rag_input(input_example)
    rag_input = dictionary_to_natural_query(rag_input)
    print(rag_input)
    
