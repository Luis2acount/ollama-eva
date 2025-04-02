from flask import Flask, request, jsonify
import os
import requests

app = Flask(__name__)

OLLAMA_URL = os.getenv("OLLAMA_URL", "http://localhost:11434/api/generate")

@app.route("/api/generate", methods=["POST"])
def proxy_ollama():
    try:
        payload = request.json
        response = requests.post(OLLAMA_URL, json=payload)
        return jsonify(response.json()), response.status_code
    except Exception as e:
        return jsonify({"error": str(e)}), 500

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8000)
