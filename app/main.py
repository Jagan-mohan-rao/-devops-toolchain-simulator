from flask import Flask, jsonify

app = Flask(__name__)


@app.route("/")
def home():
    return jsonify({
        "project": "DevOps Toolchain Simulator",
        "message": "Application updated through automated CI/CD pipeline.",
        "status": "success"
    })


@app.route("/health")
def health():
    return jsonify({
        "status": "healthy",
        "application": "DevOps Toolchain Simulator"
    })


@app.route("/pipeline")
def pipeline():
    stages = [
        "Source Code Management",
        "Build",
        "Testing",
        "Docker Build",
        "Deployment"
    ]

    return jsonify({
        "pipeline": "DevOps CI/CD Pipeline",
        "stages": stages,
        "status": "ready"
    })


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=False)

# Testing automatic GitHub to Jenkins integration