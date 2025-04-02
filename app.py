from flask import Flask, request, jsonify
from flask_cors import CORS
import requests

app = Flask(__name__)
CORS(app)

OLLAMA_URL = "http://localhost:11434/api/generate"  # Ollama interno

@app.route("/chat", methods=["POST"])
def chat():
    data = request.get_json()
    prompt = data.get("prompt", "")
    model = data.get("model", "llama3")

    if not prompt:
        return jsonify({"error": "Falta el prompt"}), 400

    try:
        payload = {
            "model": model,
            "prompt": prompt,
            "stream": False
        }
        response = requests.post(OLLAMA_URL, json=payload)
        response.raise_for_status()

        res_json = response.json()
        return jsonify({
            "response": res_json.get("response", "")
        })

    except Exception as e:
        return jsonify({"error": str(e)}), 500

@app.route("/")
def index():
    return "✅ Backend Flask para Ollama está activo."
