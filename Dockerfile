FROM python:3.11-slim

ENV OLLAMA_HOST=0.0.0.0

# Dependencias básicas
RUN apt-get update && \
    apt-get install -y curl && \
    rm -rf /var/lib/apt/lists/*

# Instala Ollama
RUN curl -fsSL https://ollama.com/install.sh | sh

# Copia el código del backend
WORKDIR /app
COPY . .

# Instala dependencias de Python
RUN pip install --no-cache-dir -r requirements.txt

# Hace ejecutable el script de inicio
RUN chmod +x start.sh

# Exponer puerto de Flask
EXPOSE 8000

CMD ["./start.sh"]
