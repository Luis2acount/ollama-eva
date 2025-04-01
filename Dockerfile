FROM debian:bookworm-slim

ENV OLLAMA_HOST=0.0.0.0

# Instalar dependencias y Ollama
RUN apt-get update && \
    apt-get install -y curl gnupg ca-certificates && \
    rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://ollama.com/install.sh | sh

# Exponer el puerto de Ollama
EXPOSE 11434

# Al iniciar: descargar el modelo y servir
CMD bash -c "ollama pull llama3 && ollama serve"
