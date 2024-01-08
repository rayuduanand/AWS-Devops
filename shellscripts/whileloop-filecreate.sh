#!/bin/bash

# While loop example to create multiple files

# Specify the number of files to create
num_files=5

# Initialize a counter
counter=1

# Use a while loop to create files
while [ "$counter" -le "$num_files" ]; do
    filename="file$counter.txt"
    echo "Creating $filename..."
    touch "$filename"
    ((counter++))
done

echo "Files created successfully."
