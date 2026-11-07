# DevOps Toolchain Simulator

A small Flask application paired with a Jenkins declarative pipeline that demonstrates an end-to-end containerized CI/CD workflow: checkout, automated tests, Docker image build, container smoke test, deployment, and post-deployment health verification.

> **Resume-ready summary:** Built a Jenkins CI/CD simulator with a six-stage pipeline that runs pytest in Python 3.12, builds and smoke-tests a Docker image, deploys the Flask app, and verifies its health endpoint.

## What the pipeline does

The `Jenkinsfile` defines these six stages:

| Stage | What happens |
| --- | --- |
| Source Code Checkout | Jenkins checks out the source from SCM. |
| Automated Unit Testing | Runs `scripts/run_tests.sh` in a `python:3.12-slim` container; installs `requirements.txt`, runs pytest, and writes JUnit output to `test-results.xml`. |
| Build Docker Image | Builds the application image as `devops-toolchain-simulator:ci` by default. |
| Test Docker Container | Starts a temporary container and runs the health check against it. |
| Deploy Application | Replaces the prior app container and publishes container port 5000 on host port 5001. |
| Verify Deployment | Runs the health check against the deployed app container. |

Jenkins polls SCM every two minutes (`H/2 * * * *`). The pipeline archives `test-results.xml` when available and reports the application URL as `http://localhost:5001` after a successful run.

## Application endpoints

The Flask app exposes:

- `GET /` — project name and application status.
- `GET /health` — health status used by container and deployment checks.
- `GET /pipeline` — pipeline status and the app's five illustrative stages: Source Code Management, Build, Testing, Docker Build, and Deployment.

## Tools and technologies

- **Jenkins** — declarative pipeline, SCM polling, and JUnit artifact archiving.
- **Python 3.12, Flask, pytest** — application and automated tests.
- **Docker** — application image build, isolated test container, and deployment.
- **Shell scripts** — reusable pipeline tasks under `scripts/`.

The `jenkins/Dockerfile` is based on `jenkins/jenkins:lts-jdk21` and installs the Docker CLI plus the Pipeline, Git, and Docker Pipeline plugins. The Jenkins runtime also needs access to a Docker daemon for the pipeline's Docker commands.

## Results and measurement notes

The repository currently implements **6 Jenkins stages**, **3 HTTP endpoints**, and **4 pytest test functions** (three endpoint checks and one basic assertion). These are counts from the checked-in configuration and tests—not a claim of a measured pipeline run. No benchmark results for pipeline duration, CPU, memory, or performance improvement are included, so none are claimed here. Add timings or resource figures only after measuring them in a documented environment.

## Run locally

Run the test suite:

```sh
python -m pip install -r requirements.txt
python -m pytest tests/ -v
```

Build and run the application with Docker:

```sh
docker build -t devops-toolchain-simulator:ci .
docker run --rm -p 5001:5000 devops-toolchain-simulator:ci
```

Then check `http://localhost:5001/health` (or `http://localhost:5001/` and `http://localhost:5001/pipeline`).

## Repository layout

```text
app/          Flask application
jenkins/      Custom Jenkins image definition
scripts/      Test, image-build, container-check, deploy, and verification scripts
tests/        pytest suite
Dockerfile    Application image definition
Jenkinsfile   Declarative CI/CD pipeline
```
