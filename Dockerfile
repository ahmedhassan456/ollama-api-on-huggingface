FROM ollama/ollama:latest

RUN apt-get update && apt-get install -y \
    python3 python3-pip tini && \
    rm -rf /var/lib/apt/lists/*

ENV PYTHONUNBUFFERED=1
ENV HF_HOME=/app/.huggingface_cache
ENV OLLAMA_HOME=/app/.ollama  
ENV OLLAMA_HOST=0.0.0.0:8000
ENV OLLAMA_ORIGIN=*

RUN mkdir -p /app/.huggingface_cache /app/.ollama \
    && chmod -R 777 /app  

RUN adduser --disabled-password --gecos "" ollama-user \
    && chown -R ollama-user:ollama-user /app

WORKDIR /src

COPY requirements.txt .

RUN python3 -m pip install --no-cache-dir -r requirements.txt

USER ollama-user

COPY . .

# Expose ports
EXPOSE 8000
EXPOSE 7860

ENTRYPOINT ["/usr/bin/tini", "--"]
CMD ["sh", "-c", "ollama serve & sleep 5 && ollama pull gemma2:9b-instruct-q5_0 && ollama run gemma2:9b-instruct-q5_0 < /dev/null & uvicorn app:app --host 0.0.0.0 --port 7860 --workers 4"]