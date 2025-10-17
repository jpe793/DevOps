import json
from app.app import app

def test_root_returns_ok():
    client = app.test_client()
    resp = client.get("/")
    assert resp.status_code == 200
    data = json.loads(resp.data)
    assert data.get("status") == "ok"
