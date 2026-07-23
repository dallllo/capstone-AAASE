
from fastapi import APIRouter, UploadFile, File
from pypdf import PdfReader
from services.text_splitter_service import split_text
import os
from services.embedding_service import EmbeddingService 
from services.pinecone_service import PineconeService
import uuid
router = APIRouter(
    prefix="/upload",
    tags=["Upload"]
)

UPLOAD_FOLDER = "uploads"
os.makedirs(UPLOAD_FOLDER, exist_ok=True)

@router.get("/")
def upload_test():
    return {
        "status": "Upload Route Working ✅"
    }

@router.post("/")
async def upload_pdf(file: UploadFile = File(...)):
    file_path = os.path.join(UPLOAD_FOLDER, file.filename)
    with open(file_path, "wb") as f:
        f.write(await file.read())
    reader = PdfReader(file_path)
    text = ""
    for page in reader.pages:
        text += page.extract_text() or ""
    chunks = split_text(text)
    embedding_service = EmbeddingService()
    \
    embeddings = embedding_service.embed_chunks(chunks)

    print(f"Chunks: {len(chunks)}")
    print(f"Embeddings: {len(embeddings)}")
    
    pinecone_service = PineconeService()
    vectors = []
    for i, embedding in enumerate(embeddings):
        vectors.append({
            # "id": str(uuid.uuid4())
            "id": str(i),
            "values": embedding,
            "metadata": {
            "text": chunks[i]
        }
    })
    pinecone_service.index.upsert(vectors=vectors)
    print(pinecone_service.index.describe_index_stats())

    return {
        "file_name": file.filename,
        "pages": len(reader.pages),
        "chunks": len(chunks),
        "first_chunk": chunks[0] if chunks else ""
    }