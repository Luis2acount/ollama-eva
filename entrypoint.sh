#!/bin/bash

ollama serve &

for i in {1..30}; do
    if curl -s http://localhost:11434/api/tags > /dev/null; then
        echo "Servidor de Ollama está listo."
        break
    fi
    echo "Esperando a que el servidor de Ollama se inicie... ($i/30)"
    sleep 1
done

if ! curl -s http://localhost:11434/api/tags > /dev/null; then
    echo "Error: No se pudo conectar al servidor de Ollama después de 30 segundos."
    exit 1
fi

if ! ollama list | grep -q "llama3:8b"; then
    echo "Modelo llama3:8b no encontrado, descargando..."
    ollama pull llama3:8b
else
    echo "Modelo llama3:8b ya está instalado."
fi

wait