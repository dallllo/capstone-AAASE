# 🤖 Agentic RAG Assistant

An intelligent Agentic Retrieval-Augmented Generation (Agentic RAG) system built with **FastAPI**, **LangGraph**, **LangChain**, **OpenAI**, and **Pinecone**.

The system allows users to upload PDF documents, automatically index their content into a vector database, and interact with those documents through an AI assistant capable of reasoning, retrieving relevant information, searching the web when needed, and maintaining conversation memory.

---

# 📌 Capstone Project

Developed as the Capstone Project for the

**SDAIA – Advanced Agentic AI Engineering Program (2026)**

---

# 📖 Overview

Large Language Models (LLMs) cannot answer questions about private organizational documents because those documents are not included in their training data.

This project solves that problem using **Retrieval-Augmented Generation (RAG)**.

Instead of relying solely on pretrained knowledge, the assistant retrieves the most relevant document chunks from a vector database before generating an answer.

The project also supports:

- Document Retrieval
- Web Search
- Tool Calling
- Conversation Memory

using an Agentic AI workflow powered by **LangGraph**.

---

# ✨ Features

- 📄 Upload PDF documents
- 📚 Automatic PDF parsing
- ✂️ Intelligent document chunking
- 🧠 OpenAI Embeddings
- 📦 Pinecone Vector Database
- 🔍 Semantic similarity search
- 🤖 LangGraph ReAct Agent
- 🌐 Web Search (Tavily)
- 🧮 Calculator Tool
- 💬 Conversation Memory
- ⚡ FastAPI REST API
- 🐳 Dockerized deployment

---

# 🏗 System Architecture

```text
                 +----------------------+
                 |      Client/API      |
                 +----------+-----------+
                            |
                            ▼
                     FastAPI Backend
                            |
            +---------------+----------------+
            |                                |
            ▼                                ▼
      Upload Endpoint                  Chat Endpoint
            |                                |
            ▼                                ▼
      PDF Processing                 LangGraph Agent
            |                                |
            ▼                                ▼
      Text Chunking                 Tool Selection
            |                 ┌──────────┼──────────┐
            ▼                 ▼          ▼          ▼
   OpenAI Embeddings   Pinecone   Web Search   Calculator
            |                 │
            ▼                 ▼
      Pinecone Index   Retrieved Context
            \__________________/
                     |
                     ▼
                 OpenAI GPT
                     |
                     ▼
              Final AI Response
```

---

# 🤖 Agent Workflow

The assistant is implemented using **LangGraph's ReAct Agent**, which dynamically decides which tool should be executed based on the user's request.

Available tools include:

## 📄 Document Search

Searches uploaded company documents stored inside Pinecone.

Used when the user asks questions related to uploaded PDFs.

---

## 🌐 Web Search

Searches the internet using Tavily whenever external or real-time information is required.

Example:

- Weather
- News
- Latest technologies

---

## 🧮 Calculator

Executes mathematical calculations whenever numerical reasoning is needed.

---

## 💬 Conversation Memory

The assistant remembers previous messages inside the same conversation thread using LangGraph Checkpointer Memory.

---

# 📂 Project Structure

```text
backend/
│
├── agents/
│   └── langchain_agent.py
│
├── routes/
│   ├── upload.py
│   └── chat.py
│
├── services/
│   ├── embedding_service.py
│   ├── pinecone_service.py
│   └── llm_openai_service.py
│
├── tools/
│   ├── calculator.py
│   ├── search_documents.py
│   └── web_search.py
│
├── memory/
│
├── loaders/
│
├── uploads/
│
├── app.py
├── config.py
├── Dockerfile
├── requirements.txt
└── README.md
```

---

# 📄 Document Upload Flow

```text
Upload PDF
      │
      ▼
Read PDF
      │
      ▼
Extract Text
      │
      ▼
Split into Chunks
      │
      ▼
Generate Embeddings
      │
      ▼
Store Vectors in Pinecone
```

---

# 💬 Question Answering Flow

```text
User Question
      │
      ▼
LangGraph ReAct Agent
      │
      ▼
Reasoning
      │
      ├───────────────┐
      │               │
      ▼               ▼
Document Search   Web Search
      │
      ▼
Retrieve Context
      │
      ▼
OpenAI GPT
      │
      ▼
Final Answer
```

---

# 🛠 Technologies

## Backend

- Python 3.12
- FastAPI
- Uvicorn

## AI Frameworks

- LangChain
- LangGraph

## Large Language Model

- OpenAI GPT
- OpenAI Embeddings

## Vector Database

- Pinecone

## Search

- Tavily Search API

## Document Processing

- PyPDF

## Deployment

- Docker

---

# 📦 API Endpoints

## Upload PDF

```
POST /upload/
```

Uploads a PDF, extracts its content, generates embeddings, and stores them inside Pinecone.

---

## Chat

```
POST /chat/
```

Example:

```json
{
  "question": "Tell me about the company."
}
```

---

# 🔐 Environment Variables

Create a `.env` file.

```env
OPENAI_API_KEY=

PINECONE_API_KEY=

PINECONE_INDEX=

TAVILY_API_KEY=
```

---

# 🐳 Docker

## Build

```bash
docker build -t rag-agent .
```

## Run

```bash
docker run \
-p 8002:8002 \
--env-file .env \
rag-agent
```

---

# 🚀 Running Locally

Install dependencies

```bash
pip install -r requirements.txt
```

Run FastAPI

```bash
uvicorn app:app --reload --port 8002
```

Open Swagger

```
http://localhost:8002/docs
```

---

# 📈 Future Improvements

- Multiple document collections
- User authentication
- Streaming responses
- Hybrid Search (Keyword + Vector)
- Source citation
- Multi-user memory
- Admin dashboard
- Frontend interface (Flutter)
- Document management
- Conversation history

---

# 🎯 Problem Statement

Organizations possess valuable internal documents that are inaccessible to traditional Large Language Models.

As a result, AI assistants often generate inaccurate or hallucinated answers when asked about private knowledge.

---

# 💡 Solution

This project implements an Agentic Retrieval-Augmented Generation (RAG) architecture that enables organizations to securely upload their internal documents into a vector database.

When a user submits a question, the system retrieves the most relevant document chunks, optionally performs web search if needed, and generates a grounded response using OpenAI GPT.

This significantly improves factual accuracy while reducing hallucinations.

---

# 👩‍💻 Author

**Dalal**

Capstone Project

SDAIA – Advanced Agentic AI Engineering Program
https://github.com/SDAIAAcademy
2026
