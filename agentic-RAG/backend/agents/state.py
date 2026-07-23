from typing import TypedDict
from langgraph.graph import StateGraph, END
from agents.router import AgentRouter
from agents.nodes import rag_node, calculator_node

from typing import TypedDict

class AgentState(TypedDict):
    question: str
    tool: str
    context: str
    answer: str

graph = StateGraph(AgentState)

def router_node(state):
    state["tool"] = AgentRouter.choose(state["question"])
    return state

graph.add_node("router", router_node)
graph.add_node("rag", rag_node)
graph.add_node("calculator", calculator_node)

graph.set_entry_point("router")

graph.add_conditional_edges(
    "router",
    lambda state: state["tool"],
    {
        "rag": "rag",
        "calculator": "calculator",
    },
)

graph.add_edge("rag", END)
graph.add_edge("calculator", END)

app = graph.compile()