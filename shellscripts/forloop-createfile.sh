#!/bin/bash

# For loop example to create multiple files

# Specify the number of files to create
num_files=10

# Use a for loop to create files
for ((i = 1; i <= num_files; i++)); do
    filename="file$i.txt"
    echo "Creating $filename..."
    touch "$filename"
done

echo "Files created successfully."
