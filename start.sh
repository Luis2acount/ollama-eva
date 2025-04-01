#!/bin/bash

# Iniciar ollama en segundo plano
echo "[INFO] Iniciando servidor Ollama en segundo plano..."
ollama serve &

# Esperar unos segundos para que arranque
sleep 5

# Descargar modelo
echo "[INFO] Descargando modelo llama3..."
ollama pull llama3 || true

# Mantener el servidor activo en foreground
wait
