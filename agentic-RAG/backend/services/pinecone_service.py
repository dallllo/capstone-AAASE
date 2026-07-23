from pinecone import Pinecone
from config import settings

class PineconeService:
    def __init__(self):
        self.pc = Pinecone(
            api_key=settings.PINECONE_API_KEY
        )
        self.index = self.pc.Index(
            settings.PINECONE_INDEX
        )