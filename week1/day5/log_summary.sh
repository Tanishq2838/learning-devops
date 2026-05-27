set -e
log_file=$1
if [ -z "$log_file" ]; then
echo "Usage: ./log_summary.sh <logfile>"
exit 1
fi
if [ ! -f "$log_file" ]; then
echo "Error: $log_file not found"
exit 1
fi
echo "================================"
echo "=======Log Summary Report======="
echo "================================"
echo "File : $log_file"
echo "Date : $(date)"
echo "Total lines : $(cat $log_file | wc -l)"
echo ""
echo "--- Log Level Counts ---"
for i in INFO LEVEL WARNING; do
count=$(grep -c "$i" $log_file 2> /dev/null || echo 0)
echo "$i : $count"
done
echo ""
echo "--- Errors Found ---"
if grep -q "ERROR" $log_file; then
grep "ERROR" $log_file
else
echo "No errors found"
fi
echo ""
echo "==============================="
echo "======= Report Complete ======="
