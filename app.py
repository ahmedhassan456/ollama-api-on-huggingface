from fastapi import FastAPI, Request, HTTPException
from fastapi.responses import Response
import ollama

app = FastAPI()

@app.get('/')
def home():
    return "Hello Gemma2-9b"

@app.post("/chat")
async def chat(query: str):
    if not query:
        return {"error": "Message cannot be empty."}

    response = ollama.chat(model="gemma2:9b-instruct-q5_0", messages=[{"role": "user", "content": query}])
    return {"response": response['message']['content']}