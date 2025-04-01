#!/bin/bash

echo "[INFO] Descargando modelo llama3 si no está..."
ollama pull llama3 || true

echo "[INFO] Iniciando servidor Ollama..."
exec ollama serve
