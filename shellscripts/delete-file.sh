#!/bin/bash

# Specify the number of files to delete
num_files=10

# Use a for loop to delete files
for ((i = 1; i <= num_files; i++)); do
    filename="file$i.txt"
    if [ -e "$filename" ]; then
        echo "Deleting $filename..."
        rm "$filename"
    else
        echo "$filename does not exist."
    fi
done

echo "Files deleted successfully."
