
from fastapi import APIRouter
from pydantic import BaseModel
from agents.langchain_agent import ask_agent

router = APIRouter(
    prefix="/chat",
    tags=["Chat"]
)

class ChatRequest(BaseModel):
    question: str

@router.post("/")
def chat(request: ChatRequest):
    answer = ask_agent(request.question)
    return {
        "answer": answer
    }