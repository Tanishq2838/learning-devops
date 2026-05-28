#method 1
cp /etc/hosts /tmp/hosts_backup.txt
if [ $? -ne 0 ]; then
echo "Error : Failed to copy file"
exit 1
fi
echo "File copied successfully"

#method 2
mkdir /tmp/testdir || echo "Failed to create directory"

#method 3
mkdir /tmp/newdir && echo "Directory created successfully"

#method 4
cp /fakefile.txt /tmp/ || { echo "Copy failed, exiting"; exit 1; }
echo "This only runs if copy succeeded"

