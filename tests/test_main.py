
import sys
import os

# Add project root to Python path
sys.path.insert(
    0,
    os.path.abspath(os.path.join(os.path.dirname(__file__), ".."))
)

from app.main import app


def test_home():
    client = app.test_client()
    response = client.get("/")

    assert response.status_code == 200
    assert response.json["status"] == "success"


def test_health():
    client = app.test_client()
    response = client.get("/health")

    assert response.status_code == 200
    assert response.json["status"] == "healthy"


def test_pipeline():
    client = app.test_client()
    response = client.get("/pipeline")

    assert response.status_code == 200
    assert response.json["status"] == "ready"
    assert len(response.json["stages"]) == 5
    
    
def test_failure_demo():
    assert 10 == 20
#
