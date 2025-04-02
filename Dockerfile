FROM debian:bullseye

# Instalar dependencias necesarias
RUN apt-get update && apt-get install -y curl gnupg

# Instalar Ollama (modifica si usas otro método)
RUN curl -fsSL https://ollama.com/install.sh | sh

# Copiar script de entrada
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Exponer el puerto que usa Ollama
EXPOSE 11434

# Entrypoint
ENTRYPOINT ["/entrypoint.sh"]
