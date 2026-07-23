
from agents.graph import app

result = app.invoke(
    state,
    config={
        "configurable": {
            "thread_id": "demo"
        }
    }
)


print(result)