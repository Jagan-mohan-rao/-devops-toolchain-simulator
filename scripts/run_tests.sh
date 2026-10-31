
#!/bin/sh
set -eu

echo "Installing Python dependencies..."
python -m pip install --no-cache-dir -r requirements.txt

echo "Running automated unit tests..."
python -m pytest tests/ -v --junitxml=test-results.xml

echo "All unit tests completed successfully!"
