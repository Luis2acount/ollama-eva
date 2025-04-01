FROM debian:bookworm-slim

ENV OLLAMA_HOST=0.0.0.0

# Instala dependencias y Ollama
RUN apt-get update && \
    apt-get install -y curl gnupg ca-certificates && \
    rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://ollama.com/install.sh | bash

# Descarga el modelo (puedes cambiarlo por mistral, llama2, etc.)
RUN ollama pull llama3

# Expone el puerto de Ollama
EXPOSE 11434

# Inicia Ollama
CMD ["ollama", "serve"]
