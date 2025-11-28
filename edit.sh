#!/bin/bash
FILE="$1"
TEXT="$2"
REPLACE="$3"
if grep -q $2 "$FILE"; then
	sed -i "s#$2#$3#" "$FILE"
else
	exit
fi
size=$(stat -c%s "$1")
echo $size
time=$(stat -c %.16y $FILE)
echo $time
read HASH _ <<< "$(sha256sum "$1")"
echo $HASH

echo "src/history_of_vim.txt - $size - $time - $HASH - sha256" >> src/files.log
