
from langchain_openai import ChatOpenAI
from config import settings

def get_llm():

    return ChatOpenAI(
        model="gpt-4.1-mini",
        api_key=settings.OPENAI_API_KEY,
        temperature=0
    )