FROM ollama/ollama:latest

# Exponer el puerto predeterminado de Ollama
EXPOSE 11434

# Descargar el modelo llama3 durante la construcción del contenedor
RUN ollama pull llama3

# Comando para iniciar el servidor de Ollama
ENTRYPOINT ["ollama"]
CMD ["serve"]