# Day 9 - TCP/IP + HTTP Deep Dive

## Topics Covered
- TCP vs UDP — reliability vs speed
- TCP 3-way handshake — SYN, SYN-ACK, ACK
- Ports — 0-1023 (well-known), 1024-49151 (registered), 49152-65535 (dynamic)
- Common ports — 22 SSH, 80 HTTP, 443 HTTPS, 3306 MySQL, 5432 PostgreSQL, etc
- Listening vs connected states
- HTTP request structure — method, path, headers, body
- HTTP methods — GET, POST, PUT, PATCH, DELETE
- Idempotent vs non-idempotent operations
- HTTP response structure — status code, headers, body
- HTTP status codes — 2xx, 3xx, 4xx, 5xx
- Cookies and session management
- curl for testing HTTP requests
- Headers that matter — Authorization, Content-Type, Accept, Set-Cookie

## Key Takeaways
- TCP guarantees delivery and order, UDP prioritises speed
- Every HTTP request gets a response with a status code
- 2xx = success, 3xx = redirect, 4xx = client error, 5xx = server error
- GET is idempotent (safe to repeat), POST is not
- Ports are numbers that identify services on a machine
- curl -v shows request and response completely
- 0.0.0.0:PORT means listening on all interfaces
