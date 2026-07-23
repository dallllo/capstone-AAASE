
from langchain_core.tools import tool
import re

@tool
def calculator(question: str) -> str:
    """
    Solve mathematical expressions.
    """

    expression = re.findall(r"[0-9+\-*/(). ]+", question)

    if not expression:
        return "لا يوجد تعبير رياضي."

    expression = "".join(expression).strip()

    try:
        return str(eval(expression))
    except Exception:
        return "خطأ في العملية الحسابية."