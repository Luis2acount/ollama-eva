#!/bin/bash

# Verificar si el modelo llama3 está instalado
if ! ollama list | grep -q "llama3"; then
    echo "Modelo llama3 no encontrado, descargando..."
    ollama pull llama3
else
    echo "Modelo llama3 ya está instalado."
fi

# Iniciar el servidor de Ollama
exec ollama serve