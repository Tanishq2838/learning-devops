# Day 13 - Project 2: Log Analyser

## What it does
Parses Apache-style access log files using regex, extracts key fields (IP, timestamp, method, path, status code, size), and generates a summary report — both to terminal and as a JSON file.

Two scripts:
- `generate_logs.py` — generates a realistic fake `server.log` file (200 well-formed lines + 4 deliberately malformed lines, to simulate real-world messy data).
- `log_analyser.py` — parses `server.log` using a compiled regex pattern, counts requests per IP and per status code using `collections.Counter`, skips malformed/blank lines gracefully without crashing, and outputs both a terminal report and `log_report.json`.

## Key concepts learned
- Regex capture groups `( )` to extract structured fields from unstructured text
- Non-greedy matching (`.*?`) vs greedy matching (`.*`)
- `re.compile()` for reusable, efficient pattern matching across many lines
- `collections.Counter` for automatic frequency counting and `.most_common(n)`
- File modes: `"r"` (read), `"w"` (overwrite), `"a"` (append)
- Graceful handling of malformed input (skip and count, don't crash) — applying the Day 12 lesson on defensive error handling
- `json.dump()` vs `json.dumps()` — writing JSON directly to a file vs returning it as a string

## Known issue
"Valid lines parsed" in the report is off by one — the blank injected line is silently skipped via `continue` and isn't counted as malformed, so it's implicitly included in the "valid" count even though it was never actually parsed. Flagged for a future fix.

## How to run
```bash
python3 generate_logs.py
python3 log_analyser.py
```
