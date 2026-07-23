from langchain_core.messages import HumanMessage
from langgraph.prebuilt import create_react_agent

from services.llm_openai_service import get_llm
from memory.checkpointer import memory
from tools.calculator import calculator
from tools.search_documents import search_documents
from tools.web_search import web_search

llm = get_llm()

agent = create_react_agent(
    model=llm,
    tools=[
        calculator,
        search_documents,
        web_search,
    ],
    checkpointer=memory,
)


def ask_agent(question: str):
    result = agent.invoke(
        {
            "messages": [
                HumanMessage(content=question)
            ]
        },
        config={
            "configurable": {
                "thread_id": "demo"
            }
        }
    )
    return result["messages"][-1].content