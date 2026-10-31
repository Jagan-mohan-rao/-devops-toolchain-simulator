
#!/bin/sh
set -eu

IMAGE_NAME="${IMAGE_NAME:-devops-toolchain-simulator:ci}"

echo "Building Docker image: $IMAGE_NAME"

docker build -t "$IMAGE_NAME" .

echo "Docker image built successfully!"
