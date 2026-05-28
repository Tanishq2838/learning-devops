greet() {
echo "Good Morning"
}

greetHi() {
echo "hi $(whoami)"
}

getDiskUsage() {
local disk=$(df -h / | awk 'NR == 2 {print $5}')
echo "$disk"
}

getUser() {
echo "$(whoami)"
}

checkEven(){
local num=$1
if [ $((num%2)) -eq 0 ]; then
return 0
else
return 1
fi
}

checkFile(){
local file="$1"
if [ -f "$file" ]; then
echo "$file exists"
else
echo "$file does not exist"
fi
}

user=$(getUser)
Disk=$(getDiskUsage)
greet
greetHi
echo "Current User : $user"
echo "Current Disk Usage : $Disk"
checkEven 5
if [ $? -eq 0 ]; then
echo "Even Number"
else
echo "Odd Number"
fi
checkFile commands.txt
