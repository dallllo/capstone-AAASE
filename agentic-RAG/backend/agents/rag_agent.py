
from services.embedding_service import EmbeddingService
from services.pinecone_service import PineconeService
from services.llm_openai_service import get_llm

class RAGAgent:
    def __init__(self):
        self.embedding = EmbeddingService()
        self.pinecone = PineconeService()
        self.llm = get_llm()

    def run(self, question: str):
        query_embedding = self.embedding.embed_query(question)
        results = self.pinecone.index.query(
            vector=query_embedding,
            top_k=5,
            include_metadata=True,
        )
        print("Searching...")
        print(results)
        context = "\n\n".join(
            match["metadata"]["text"]
            for match in results["matches"]
        )

        prompt = f"""
أجب فقط اعتماداً على المعلومات التالية.

Context:
{context}

Question:
{question}
"""

        response = self.llm.invoke(prompt)

        answer = response.content

        return {
            "answer": answer,
            "matches": len(results["matches"])
        }