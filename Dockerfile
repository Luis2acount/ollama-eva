FROM debian:bookworm-slim

ENV OLLAMA_HOST=0.0.0.0

RUN apt-get update && \
    apt-get install -y curl gnupg ca-certificates && \
    rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://ollama.com/install.sh | sh

EXPOSE 11434

COPY start.sh /start.sh
CMD ["/start.sh"]
