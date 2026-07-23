
from agents.rag_agent import RAGAgent
from tools.calculator import calculator

def rag_node(state):
    rag = RAGAgent()
    result = rag.run(state["question"])
    state["answer"] = result["answer"]
    return state

def calculator_node(state):
    expression = (
        state["question"]
        .replace("كم ناتج", "")
        .replace("؟", "")
        .strip()
    )

    result = calculator.invoke(expression)
    state["answer"] = result
    return state


