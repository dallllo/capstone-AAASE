from agents.router import AgentRouter

def router_node(state):
    tool = AgentRouter.choose(
        state["question"]
    )
    print(f"Supervisor Selected -> {tool}")
    state["tool"] = tool
    return state