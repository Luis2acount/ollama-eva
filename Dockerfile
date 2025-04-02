FROM ollama/ollama:latest

# Exponer el puerto predeterminado de Ollama
EXPOSE 11434

# Comando para iniciar el servidor de Ollama
ENTRYPOINT ["ollama"]
CMD ["serve"]
