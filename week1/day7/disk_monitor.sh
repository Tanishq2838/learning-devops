set -e
set -o pipefail

#============================================
#      Disk Monitor - Production Script
#      Author : Tanishq
#      Description : Monitors disk usage
#      and logs warnings when threshold
#      is exceeded
#============================================


#--------------Configuration-----------------
threshold=80
log_file="$HOME/devops-practice/week1/day7/disk_monitor.log"
max_log_lines=1000

red='\033[0;31m'
yellow='\033[1;33m'
green='\033[0;32m'
nc='\033[0m'

log() {
local level=$1
local message=$2
local timestamp=$(date '+%Y-%m-%d %H:%M:%S')
echo "[$timestamp] [$level] $message" >> "$log_file"

case $level in
INFO) echo -e "${green}[$timestamp] [INFO]${nc} $message" ;;
WARNING) echo -e "${yellow}[$timestamp] [WARNING]${nc} $message" ;;
ERROR)   echo -e "${red}[$timestamp] [ERROR]${nc} $message" ;;
esac
}

rotate_log() {
if [ -f "$log_file" ]; then
local lines=$(wc -l < "$log_file")
if [ "$lines" -gt "$max_log_lines" ]; then
tail -500 "$log_file" > "${log_file}.tmp"
mv "${log_file}.tmp" "$log_file"
log "INFO" "Log rotated - kept last 500 lines"
fi
fi
}

check_filesystem() {
local mount=$1
local usage=$(df -h "$mount" | awk 'NR==2 {print $5}' | tr -d '%')
local available=$(df -h "$mount" | awk 'NR==2 {print $4}')
local total=$(df -h "$mount" | awk 'NR==2 {print $2}')
if [ "$usage" -gt "$threshold" ]; then
log "WARNING" "DISK ALERT: $mount is at ${usage}% (${available} of ${total} remaining)"
return 1
else
log "INFO" "OK: $mount is at ${usage}% (${available} of ${total} remaining)"
return 0
fi
}

check_all_disks() {
local alert_count=0
local mounts=$(df -h | awk 'NR>1 && $1 !~ /tmpfs|devtmpfs/ {print $6}')
for mount in $mounts; do
check_filesystem "$mount" || alert_count=$((alert_count + 1))
done
return $alert_count
}

print_summary() {
echo ""
echo "===================================================="
echo "               Disk Usage Summary"
echo "===================================================="
df -h | awk 'NR==1 || ($1 !~ /tmpfs|devtmpfs|udev/)' | awk '{printf "%-20s %5s %5s %5s %5s\n", $1, $2, $3, $4, $5}'
echo "===================================================="
}

main() {
rotate_log
log "INFO" "==== Disk Monitor Started ===="
log "INFO" "Threshold : ${threshold}"
log "INFO" "Hostname : $(hostname)"

print_summary
echo""
log "INFO" "Checking filesystems..."
check_all_disks
local ALERTS=$?
echo ""
if [ "$ALERTS" -gt 0 ]; then
log "WARNING" "=== Check complete : $ALERTS filesystem(s) above threshold ==="
else
log "INFO" "=== Check complete : all filesystems OK ==="
fi

log "INFO" "Log saved to : $log_file"
}

main
