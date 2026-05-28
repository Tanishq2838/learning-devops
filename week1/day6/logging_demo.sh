log_file="/tmp/script_$$.log"
log() {
local level=$1
local message=$2
local timeStamp=$(date '+%Y-%m-%d %H:%M:%S')
echo "[$timeStamp] [$level] $message" | tee -a "$log_file"
}
log "INFO" "Script Started"
log "INFO" "Current user : $(whoami)"
log "INFO" "Checking disk space..."

disk=$(df -h / | awk 'NR==2 {print $5}' | tr -d '%')

if [ "$disk" -gt 80 ]; then
log "WARNING" "Disk usage is at ${disk}% - getting high"
else
log "INFO" "Disk usage is at ${disk}% - OK"
fi

log "INFO" "Script Completed"
echo ""
echo "Full log saved to : $log_file"
cat "$log_file"
