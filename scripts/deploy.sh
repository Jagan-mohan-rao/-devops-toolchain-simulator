
#!/bin/sh
set -eu

IMAGE_NAME="${IMAGE_NAME:-devops-toolchain-simulator:ci}"
CONTAINER_NAME="${CONTAINER_NAME:-devops-ci-app}"
APP_PORT="${APP_PORT:-5001}"

echo "Removing previous deployment if it exists..."

docker rm -f "$CONTAINER_NAME" >/dev/null 2>&1 || true

echo "Deploying application..."

docker run -d \
    --name "$CONTAINER_NAME" \
    -p "$APP_PORT:5000" \
    "$IMAGE_NAME"

echo "Application deployed on port $APP_PORT!"
