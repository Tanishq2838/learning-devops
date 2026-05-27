read -p "Enter a number : " in
if [ $in -gt 100 ]; then
echo "Number is greater than 100"
elif [ $in -eq 100 ]; then
echo "Number is exactly 100"
else
echo "Number is less than 100"
fi
