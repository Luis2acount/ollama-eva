FROM debian:bullseye  # o la base que estés usando

RUN apt-get update && apt-get install -y curl

# Instalar Ollama (si es necesario)
# COPY ollama etc...

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
