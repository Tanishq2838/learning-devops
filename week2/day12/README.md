# Day 12 - Python + Networking (requests library)

## Topics Covered
- requests library — GET, POST, PUT, DELETE
- Response object — status_code, ok, headers, text, json()
- Sending JSON and form data in POST requests
- Custom headers and User-Agent
- Authentication — Bearer token, Basic Auth
- Error handling — Timeout, ConnectionError, HTTPError, RequestException
- raise_for_status() for clean error detection
- Logging pattern — writing to screen and file simultaneously
- Measuring request response time
- Built a complete API health checker script
- Scheduled the health checker with cron

## Scripts Built Today
- basic_requests.py — first GET request, exploring status_code and text
- response_object.py — response.ok, headers, json() parsing
- status_check.py — classifying multiple URLs by status code
- post_requests.py — POST, PUT, DELETE with JSON, safe status checking before .json()
- headers_auth.py — custom headers, Bearer token, Basic Auth
- error_handling.py — safe_request() function handling 4 distinct failure types
- health_checker.py — complete API monitoring script with logging and timing

## Key Takeaways
- requests.get(url, json=data) automatically serializes data and sets Content-Type
- Never call .json() without checking status_code first — crashes on non-JSON responses
- Always set timeout= on every request — without it, a hanging server freezes the script forever
- response.raise_for_status() turns bad HTTP status codes into catchable Python exceptions
- Real monitoring scripts must handle Timeout, ConnectionError, and HTTPError as distinct cases
- This connects Day 6 (bash error handling) and Day 9 (HTTP) directly into working Python code
- httpbin.org had a real outage today — a good reminder that even "reliable" test services go down,
  and production code must always assume failure is possible

## Notes
httpbin.org was returning 503 errors throughout today's session, so postman-echo.com and
api.github.com were used as alternative test endpoints. All core concepts remain identical.
