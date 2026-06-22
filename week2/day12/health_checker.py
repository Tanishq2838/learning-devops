import requests
import time
from datetime import datetime

SERVICES = [
    {"name": "GitHub API", "url": "https://api.github.com"},
    {"name": "Postman Echo", "url": "https://postman-echo.com/get"},
    {"name": "Google", "url": "https://google.com"},
    {"name": "Fake Service", "url": "https://this-does-not-exist-xyz123.com"},
]

LOG_FILE = "health_check.log"
TIMEOUT = 5

def log(level, message):
    timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    log_line = f"[{timestamp}] [{level}] {message}"
    print(log_line)
    with open(LOG_FILE, "a") as f:
        f.write(log_line + "\n")

def check_service(name, url):
    start_time = time.time()
    try:
        response = requests.get(url, timeout=TIMEOUT)
        elapsed = round((time.time() - start_time) * 1000, 2)

        if response.status_code == 200:
            log("INFO", f"{name} is UP - {response.status_code} ({elapsed}ms)")
            return True
        else:
            log("WARNING", f"{name} returned {response.status_code} ({elapsed}ms)")
            return False

    except requests.exceptions.Timeout:
        log("ERROR", f"{name} TIMED OUT after {TIMEOUT}s")
        return False
    except requests.exceptions.ConnectionError:
        log("ERROR", f"{name} is DOWN - connection failed")
        return False
    except requests.exceptions.RequestException as e:
        log("ERROR", f"{name} - unexpected error: {e}")
        return False

def check_all_services():
    log("INFO", "=== Health Check Started ===")
    results = {"up": 0, "down": 0}

    for service in SERVICES:
        is_up = check_service(service["name"], service["url"])
        if is_up:
            results["up"] += 1
        else:
            results["down"] += 1

    log("INFO", f"=== Check Complete: {results['up']} UP, {results['down']} DOWN ===")
    return results

if __name__ == "__main__":
    results = check_all_services()
    print("\n" + "="*40)
    print("  SUMMARY")
    print("="*40)
    print(f"  Total services checked: {len(SERVICES)}")
    print(f"  UP: {results['up']}")
    print(f"  DOWN: {results['down']}")
    print("="*40)
