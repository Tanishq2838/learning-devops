set -e

cleanup() {
echo "Cleaning up temporary files..."
rm -f /tmp/tempfile_$$.txt
echo "Cleanup done"
}

handle_error() {
echo "Error : Script failed on line $LINENO"
echo "Last command exit code: $?"
}

trap cleanup EXIT
trap handle_error ERR

echo "Creating temp file..."
touch /tmp/tempfile_$$.txt

echo "Simulating an error..."
ls /fakefolder

echo "This never runs"

