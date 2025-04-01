#!/bin/bash

# Descargar el modelo si no está
ollama pull llama3 || true

# Ahora arrancar el servidor
exec ollama serve
