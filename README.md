# DevOps Toolchain Simulator

A lightweight DevOps simulation project that demonstrates a CI/CD pipeline using Python, Docker, Jenkins, and deployment automation scripts. The application exposes a simple Flask service and includes automated test, build, container validation, and deployment stages.

## Repository Summary

- Repository: `Jagan-mohan-rao/-devops-toolchain-simulator`
- Repository ID: `1440242031`
- Default branch: `main`
- Visibility: `Public`
- Archived: `No`
- Fork: `No`
- License: `None`
- Primary language: `Python`
- Repository size: `10 KB`
- Created: `7 days ago`
- Last pushed: `2026-10-31T06:42:37Z`
- Last updated: `6 days ago`

## GitHub Metrics and Numbers

- Stars: `0`
- Watchers: `0`
- Forks: `0`
- Open issues: `0`
- Total issues: `0`
- Subscribers: `0`
- Network count: `0`
- Has projects: `Yes`
- Has wiki: `Yes`
- Has pages: `No`
- Has discussions: `No`
- Pull requests enabled: `Yes`
- Issues enabled: `Yes`

## Language Composition

| Language | Percentage |
| --- | ---: |
| Python | 48.8% |
| Shell | 35.8% |
| Dockerfile | 15.4% |

## Project Structure

The repository contains the following key components:

- `app/` - Flask application source
- `scripts/` - Build, deploy, health check, and verification automation scripts
- `tests/` - Automated test suite
- `jenkins/` - Jenkins Docker environment configuration
- `Dockerfile` - Application container definition
- `Jenkinsfile` - CI/CD pipeline definition
- `requirements.txt` - Python dependencies

### File Count Snapshot

- Top-level entries: `9`
- Application files: `1` (`app/main.py`)
- Shell scripts: `6` (`scripts/*.sh`)
- Python utility/test files: `2` (`scripts/health_check.py`, `tests/test_main.py`)
- Docker files: `3` (`Dockerfile`, `jenkins/Dockerfile`, `.dockerignore`)

## Application Details

- Framework: `Flask`
- Application port: `5000`
- Health endpoint: `/health`
- Root endpoint: `/`
- Pipeline endpoint: `/pipeline`
- Pipeline stages: `5`
  1. Source Code Management
  2. Build
  3. Testing
  4. Docker Build
  5. Deployment

## CI/CD Pipeline Details

- Jenkins pipeline: enabled
- Trigger mode: `pollSCM('H/2 * * * *')`
- Poll interval: `every 2 minutes`
- Jenkins image: `jenkins/jenkins:lts-jdk21`
- Application container name: `devops-ci-app`
- Jenkins app port: `5001`
- Container image name: `devops-toolchain-simulator:ci`

### Pipeline Stages Executed

1. `Source Code Checkout`
2. `Automated Unit Testing`
3. `Build Docker Image`
4. `Test Docker Container`
5. `Deploy Application`
6. `Verify Deployment`

## Build and Runtime Environment

- Base Docker image: `python:3.12-slim`
- Working directory: `/app`
- Python dependency file: `requirements.txt`
- Boot command: `python -m app.main`

## Testing Summary

- Test suite file(s): `1`
- Test file: `tests/test_main.py`
- Test script: `scripts/run_tests.sh`
- Test result artifact: `test-results.xml`

## Operational Scripts

The repository contains the following automation scripts:

- `scripts/build_image.sh` - Builds the Docker image
- `scripts/deploy.sh` - Deploys the containerized app
- `scripts/health_check.py` - Health validation utility
- `scripts/run_tests.sh` - Executes unit tests
- `scripts/test_container.sh` - Validates the built container
- `scripts/verify_deployment.sh` - Verifies the deployment is healthy

## Quick Start

```bash
pip install -r requirements.txt
python -m app.main
```

Then access:

- `http://localhost:5000/`
- `http://localhost:5000/health`
- `http://localhost:5000/pipeline`

## Notes

This repo is configured to simulate a realistic DevOps workflow with source control, automated testing, Docker packaging, Jenkins orchestration, and deployment verification. The project is intentionally simple but demonstrates common CI/CD behaviors in a compact setup.

---

Project status: Active / CI/CD ready
