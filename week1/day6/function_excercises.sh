print_seperator() {
echo "=============================="
}

print_Header() {
local Title=$1
print_seperator
echo "         $Title"
print_seperator
}

command_exists() {
local cmd=$1
if command -v "$cmd" > /dev/null 2>&1; then
return 0
else
return 1
fi
}

get_file_size() {
local file=$1
if [ -f "$file" ]; then
du -sh "$file" | cut -f1
else
echo "File not found"
fi
}

count_lines() {
local file=$1
if [ -f "$file" ]; then
cat "$file" | wc -l
else
echo "0"
fi
}

print_Header "System Check"

if command_exists "git"; then
echo "git is installed"
else
echo "git is not installed"
fi

if command_exists "docker"; then
echo "docker is installed"
else
echo "docker is not installed"
fi

print_Header "File Info"
echo "Size of /etc/passwd : $(get_file_size /etc/passwd)"
echo "Lines in /etc/passwd : $(count_lines /etc/passwd)"

