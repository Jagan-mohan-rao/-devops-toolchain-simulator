
#!/bin/sh
set -eu

IMAGE_NAME="${IMAGE_NAME:-devops-toolchain-simulator:ci}"
CONTAINER_NAME="devops-ci-test"

echo "Starting temporary test container..."

docker rm -f "$CONTAINER_NAME" >/dev/null 2>&1 || true
docker run -d --name "$CONTAINER_NAME" "$IMAGE_NAME"

cleanup() {
    docker rm -f "$CONTAINER_NAME" >/dev/null 2>&1 || true
}

trap cleanup EXIT

sleep 5

echo "Checking application health..."

docker exec "$CONTAINER_NAME" python ./scripts/health_check.py

echo "Container test successful!"
