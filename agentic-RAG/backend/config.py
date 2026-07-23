from pydantic_settings import BaseSettings, SettingsConfigDict

class Settings(BaseSettings):
    # OPENROUTER_API_KEY: str
    # OPENROUTER_MODEL: str
    OPENAI_API_KEY:str
    PINECONE_API_KEY: str
    PINECONE_INDEX: str

    LANGSMITH_API_KEY: str
    LANGSMITH_TRACING: bool = True
    LANGSMITH_ENDPOINT: str
    LANGSMITH_PROJECT: str
    TAVILY_API_KEY: str
    model_config = SettingsConfigDict(
        env_file=".env",
        extra="ignore"
    )

settings = Settings()