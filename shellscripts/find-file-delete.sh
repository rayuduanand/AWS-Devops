#!/bin/bash

# Specify the directory path and size threshold (in megabytes)
directory="/path/to/directory"
size_threshold=100

# Check if the script is run with appropriate permissions
if [ "$EUID" -ne 0 ]; then
    echo "Please run this script as root or with sudo."
    exit 1
fi

# Find and prompt user for confirmation before deleting large files
echo "Finding files larger than ${size_threshold}MB in ${directory}..."

files_to_delete=$(find "$directory" -type f -size +"$size_threshold"M)

if [ -z "$files_to_delete" ]; then
    echo "No files found that meet the criteria."
    exit 0
fi

echo "The following files will be deleted:"
echo "$files_to_delete"

read -p "Do you want to proceed with the deletion? (y/n): " confirmation

if [ "$confirmation" != "y" ]; then
    echo "Deletion aborted."
    exit 0
fi

# Delete the files
echo "Deleting files..."
echo "$files_to_delete" | xargs rm -f

echo "Deletion completed successfully."
