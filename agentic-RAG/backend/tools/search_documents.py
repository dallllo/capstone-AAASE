from langchain_core.tools import tool
from services.embedding_service import EmbeddingService
from services.pinecone_service import PineconeService


@tool
def search_documents(question: str):
    """
    Search company documents.
    """

    embedding = EmbeddingService()
    pinecone = PineconeService()
    query_embedding = embedding.embed_query(question)
    results = pinecone.index.query(
        vector=query_embedding,
        top_k=5,
        include_metadata=True
    )

    context = "\n\n".join(
        match["metadata"]["text"]
        for match in results["matches"]
    )

    return context