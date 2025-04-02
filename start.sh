#!/bin/bash

# Start Ollama in background
echo "[INFO] Iniciando Ollama..."
ollama serve &

# Espera a que Ollama levante (puedes ajustar segundos si es necesario)
sleep 5

# Descarga el modelo si no está
echo "[INFO] Verificando modelo llama3..."
ollama pull llama3 || echo "[WARN] No se pudo cargar llama3"

# Inicia Flask
echo "[INFO] Levantando servidor Flask..."
python3 app.py
