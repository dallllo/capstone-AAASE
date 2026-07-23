from fastapi import FastAPI
from routes.upload import router as upload_router
from routes.chat import router as chat_router
from config import settings
app = FastAPI(title="Agentic RAG API")

app.include_router(upload_router)
app.include_router(chat_router)

@app.get("/")
def root():
    return {
        "message": "Agentic RAG Server Running 🚀"
    }