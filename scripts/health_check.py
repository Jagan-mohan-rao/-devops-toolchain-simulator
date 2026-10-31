
import json
import sys
from urllib.request import urlopen

url = "http://localhost:5000/health"

try:
    with urlopen(url, timeout=5) as response:
        data = json.loads(response.read().decode())

        if response.status == 200 and data.get("status") == "healthy":
            print("Health Check: PASSED")
            print(data)
        else:
            print("Health Check: FAILED")
            sys.exit(1)

except Exception as error:
    print("Health Check: FAILED")
    print(error)
    sys.exit(1)
