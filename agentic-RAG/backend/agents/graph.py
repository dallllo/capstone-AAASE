
from langgraph.graph import StateGraph, END
from agents.state import AgentState
from agents.router_node import router_node
from memory.checkpointer import memory
from agents.nodes import (
    rag_node,
    calculator_node,
)
builder = StateGraph(AgentState)
builder.add_node(
    "router",
    router_node
)

builder.add_node(
    "rag",
    rag_node
)

builder.add_node(
    "calculator",
    calculator_node
)
builder.set_entry_point("router")
builder.add_conditional_edges(
    "router",
    lambda state: state["tool"],
    {
        "rag": "rag",
        "calculator": "calculator",
    }
)
builder.add_edge(
    "rag",
    END
)

builder.add_edge(
    "calculator",
    END
)
app = builder.compile()
