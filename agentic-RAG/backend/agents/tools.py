from langchain_core.tools import tool
from services.embedding_service import EmbeddingService
from services.pinecone_service import PineconeService
from tools.calculator import calculator

tools = [
    calculator,
    search_documents,
]
