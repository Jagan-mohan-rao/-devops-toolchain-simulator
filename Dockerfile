
# Use Python base image
FROM python:3.12-slim

# Set working directory
WORKDIR /app

# Copy dependency file
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy application files
COPY app/ ./app/

# Expose application port
EXPOSE 5000

# Start Flask application
CMD ["python", "-m", "app.main"]
