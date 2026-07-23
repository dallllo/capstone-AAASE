from langchain_core.tools import tool
from tavily import TavilyClient
from config import settings
from config import settings


client = TavilyClient(
    api_key=settings.TAVILY_API_KEY
)


@tool
def web_search(question: str) -> str:
    """
    Search the internet for recent information.
    """

    response = client.search(
        query=question,
        search_depth="advanced",
        max_results=5,
    )

    results = []

    for item in response["results"]:
        results.append(
            f"""
Title:
{item["title"]}

Content:
{item["content"]}

URL:
{item["url"]}
"""
        )

    return "\n\n".join(results)