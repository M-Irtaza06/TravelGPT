from langchain_core.pydantic_v1 import BaseModel, Field

class Output(BaseModel):
    prompt: str = Field(description="Prompt for the query")
    name: list = Field(description="Names of item")
    tel: list = Field(description="telephone numbers")
    address: list = Field(description="addresses")
    category: list = Field(description="categories")
    explanation: list = Field(description="explanations")
    item_type: list = Field(description="types of items, should be one of the Travel Destination\
                            , Accommodation, Car Rental Company, Cafe, Restaurant")
    source: list = Field(description="source of the information or url or http")