
#!/bin/sh
set -eu

CONTAINER_NAME="${CONTAINER_NAME:-devops-ci-app}"

echo "Verifying deployed application..."

sleep 5

docker exec "$CONTAINER_NAME" python ./scripts/health_check.py

echo "Deployment verification successful!"
