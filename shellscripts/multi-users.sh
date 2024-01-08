#!/bin/bash

# Check if the script is run as root
if [ "$EUID" -ne 0 ]; then
    echo "Please run this script as root or with sudo."
    exit 1
fi

# Function to create a user
create_user() {
    local username="$1"
    local password="$2"

    # Check if the user already exists
    if id "$username" &>/dev/null; then
        echo "User '$username' already exists."
        return
    fi

    # Create user
    useradd -m -s /bin/bash "$username"

    # Set password for the user
    echo "$username:$password" | chpasswd

    # Display information
    echo "User '$username' created successfully."
}

# Read usernames and passwords from the file
while read -r username password; do
    create_user "$username" "$password"
done < userlist.txt

# Note: Make sure that userlist.txt contains lines in the format "username password"
# Example:
# user1 password1
# user2 password2
# ...

# Additional checks and validations can be added based on your specific requirements.
