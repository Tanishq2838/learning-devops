# Project 1 — Disk Monitor

A production-grade bash script that monitors disk usage across all
filesystems and logs warnings when usage exceeds a configurable threshold.

## Features
- Monitors all mounted filesystems automatically
- Colour coded terminal output (green=OK, yellow=WARNING)
- Timestamped logging to file
- Automatic log rotation when file gets too large
- Configurable threshold (default 80%)
- Designed to run as a cron job

## Usage
chmod +x disk_monitor.sh
./disk_monitor.sh

## Cron setup (run every hour)
0 * * * * /full/path/to/disk_monitor.sh

## Configuration
Edit these variables at the top of the script:
- THRESHOLD — disk usage % to trigger warning (default 80)
- LOG_FILE — where to save logs
- MAX_LOG_LINES — when to rotate the log file

## Sample Output
[2026-05-28 08:00:01] [INFO] === Disk Monitor Started ===
[2026-05-28 08:00:01] [INFO] Threshold: 80%
[2026-05-28 08:00:01] [INFO] OK: / is at 45% (120G of 220G remaining)
[2026-05-28 08:00:01] [INFO] === Check complete: all filesystems OK ===

## Tech Stack
- Bash scripting
- df, awk, grep, wc — Linux core utilities
- cron — for scheduling

## Author
Tanishq — github.com/Tanishq2838
