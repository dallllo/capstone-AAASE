
from langchain_openai import OpenAIEmbeddings
from config import settings

class EmbeddingService:

    def __init__(self):
        self.embedding_model = OpenAIEmbeddings(
            model="text-embedding-3-small",
            api_key=settings.OPENAI_API_KEY,
        )

    def embed_chunks(self, chunks: list[str]):
        return self.embedding_model.embed_documents(chunks)

    def embed_query(self, query: str):
        return self.embedding_model.embed_query(query)