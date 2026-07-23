class AgentRouter:

    @staticmethod
    def choose(question: str):
        q = question.lower()
        if "+" in q or "-" in q or "*" in q or "/" in q:
            return "calculator"
        return "rag"
    