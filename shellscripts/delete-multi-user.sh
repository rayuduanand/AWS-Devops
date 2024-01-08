#!/bin/bash

# Check if the script is run as root
if [ "$EUID" -ne 0 ]; then
    echo "Please run this script as root or with sudo."
    exit 1
fi

# Function to delete a user
delete_user() {
    local username="$1"

    # Check if the user exists
    if id "$username" &>/dev/null; then
        # Delete user
        userdel -r "$username"
        echo "User '$username' deleted successfully."
    else
        echo "User '$username' does not exist."
    fi
}

# Read usernames from the file
while read -r username _; do
    delete_user "$username"
done < userlist.txt

# Note: Make sure that userlist.txt contains lines with usernames only
# Example:
# user1
# user2
# ...

