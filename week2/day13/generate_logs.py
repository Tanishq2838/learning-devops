import random
from datetime import datetime, timedelta
ips = ["192.168.1.10", "10.0.0.5", "172.16.0.23", "203.0.113.42", "198.51.100.7"]

paths = ["/index.html", "/login", "/api/users", "/images/logo.png", "/about", "/contact"]

methods = ["GET", "POST", "PUT", "DELETE"]

status_codes = [200, 200, 200, 201, 301, 404, 404, 500]

def generate_log_line(timestamp):
    ip = random.choice(ips)
    method = random.choice(methods)
    path = random.choice(paths)
    status = random.choice(status_codes)
    size = random.randint(200, 5000)
    time_str = timestamp.strftime("%d/%b/%Y:%H:%M:%S +0530")

    return f'{ip} - - [{time_str}] "{method} {path} HTTP/1.1" {status} {size}'

def generate_log_file(filename, num_lines=200):
    start_time = datetime.now()

    with open(filename, "w") as f:
        for i in range(num_lines):
            current_time = start_time + timedelta(seconds=i*2)
            line = generate_log_line(current_time)
            f.write(line + "\n")

    print(f"Generated {num_lines} log lines in {filename}")

def inject_malformed_lines(filename):
    malformed_lines = [
        "this is not a valid log line at all\n",
        "192.168.1.99 - - incomplete entry\n",
        "\n",
        '10.0.0.99 - - [25/Jun/2026:14:35:00 +0530] "BADMETHOD /weird-path"\n'
    ]

    with open(filename, "a") as f:
        for line in malformed_lines:
            f.write(line)

    print(f"Injected {len(malformed_lines)} malformed lines into {filename}")

if __name__ == "__main__":
    generate_log_file("server.log", 200)
    inject_malformed_lines("server.log")
