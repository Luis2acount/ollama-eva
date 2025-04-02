FROM debian:bookworm-slim

# Permitir acceso desde cualquier IP
ENV OLLAMA_HOST=0.0.0.0

# Instalar dependencias básicas
RUN apt-get update && \
    apt-get install -y curl ca-certificates gnupg && \
    rm -rf /var/lib/apt/lists/*

# Instalar Ollama
RUN curl -fsSL https://ollama.com/install.sh | sh

# Exponer el puerto por defecto
EXPOSE 11434

# Iniciar el servidor Ollama directamente
CMD ["ollama", "serve"]
