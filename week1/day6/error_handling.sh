set -e
set -u
set -o pipefail
echo "Script started"
cat fakefile.txt | grep "something"
echo "$?"

