#!/bin/bash

# Check if the script is run with appropriate permissions
if [ "$EUID" -ne 0 ]; then
    echo "Please run this script as root or with sudo."
    exit 1
fi

# Function to create a folder
create_folder() {
    local folder_name="$1"

    # Check if the folder already exists
    if [ -d "$folder_name" ]; then
        echo "Folder '$folder_name' already exists."
        return
    fi

    # Create folder
    mkdir "$folder_name"

    # Display information
    echo "Folder '$folder_name' created successfully."
}

# Read folder names from the file
while IFS= read -r folder_name; do
    create_folder "$folder_name"
done < folderlist.txt

# Note: Make sure that folderlist.txt contains one folder name per line
# Example:
# folder1
# folder2
# ...

# Additional checks and validations can be added based on your specific requirements.
