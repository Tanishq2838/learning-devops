file=$1
if [ -z "$file" ]; then
echo "ERROR : No File name given"
echo "Usage : ./fileChecker.sh filename"
exit 1
fi
if [ -f "$file" ]; then
echo "$file exists"
echo "Lines : $(cat $file | wc -l)"
echo "Size : $(du -sh $file | cut -f1)"
elif [ -d "$file" ]; then
echo "$file is a directory"
echo "Contents : $(ls $file | wc -l)"
else
echo "$file does not exist"
fi

