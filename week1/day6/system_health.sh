#!/bin/bash
set -e
set -o pipefail

DISK_THRESHOLD=80
LOG_FILE="$HOME/devops-practice/week1/day6/health_check.log"

log() {
    local LEVEL=$1
    local MESSAGE=$2
    local TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
    echo "[$TIMESTAMP] [$LEVEL] $MESSAGE" | tee -a "$LOG_FILE"
}

print_header() {
    local TITLE=$1
    echo ""
    echo "================================"
    echo "  $TITLE"
    echo "================================"
}

check_disk() {
    local USAGE=$(df -h / | awk 'NR==2 {print $5}' | tr -d '%')
    local AVAILABLE=$(df -h / | awk 'NR==2 {print $4}')
    if [ "$USAGE" -gt "$DISK_THRESHOLD" ]; then
        log "WARNING" "Disk usage is ${USAGE}% — above threshold"
    else
        log "INFO" "Disk usage is ${USAGE}% — OK (${AVAILABLE} available)"
    fi
}

check_memory() {
    local TOTAL=$(free -m | awk 'NR==2 {print $2}')
    local USED=$(free -m | awk 'NR==2 {print $3}')
    local FREE=$(free -m | awk 'NR==2 {print $4}')
    local USAGE_PCT=$(( (USED * 100) / TOTAL ))
    log "INFO" "Memory — Total: ${TOTAL}MB Used: ${USED}MB Free: ${FREE}MB (${USAGE_PCT}% used)"
}

check_cpu() {
    local LOAD=$(uptime | awk -F'load average:' '{print $2}' | cut -d, -f1 | tr -d ' ')
    log "INFO" "CPU load average (1 min): $LOAD"
}

check_service() {
    local SERVICE=$1
    if pgrep -x "$SERVICE" > /dev/null 2>&1; then
        log "INFO" "Service $SERVICE is running"
    else
        log "WARNING" "Service $SERVICE is NOT running"
    fi
}

check_log_errors() {
    local LOG=$1
    if [ -f "$LOG" ]; then
        local ERROR_COUNT=$(grep -c "ERROR" "$LOG" 2>/dev/null || echo 0)
        log "INFO" "Found $ERROR_COUNT errors in $LOG"
    else
        log "INFO" "Log file $LOG not found — skipping"
    fi
}

main() {
    > "$LOG_FILE"

    log "INFO" "======= Health Check Started ======="
    log "INFO" "Hostname: $(hostname)"
    log "INFO" "User: $(whoami)"
    log "INFO" "Date: $(date)"

    print_header "Disk Space"
    check_disk || true

    print_header "Memory"
    check_memory

    print_header "CPU"
    check_cpu

    print_header "Services"
    for service in bash cron ssh; do
        check_service "$service" || true
    done

    print_header "Log Errors"
    check_log_errors "$HOME/devops-practice/week1/day4/server.log"

    log "INFO" "======= Health Check Complete ======="
    echo ""
    echo "Full log saved to: $LOG_FILE"
}

main
