#!/bin/bash

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

# Define usernames and passwords
usernames=("user1" "user2" "user3")
passwords=("password1" "password2" "password3")

# Check if the script is run as root
if [ "$EUID" -ne 0 ]; then
    echo "Please run this script as root or with sudo."
    exit 1
fi

# Loop through usernames and create users
for ((i = 0; i < ${#usernames[@]}; i++)); do
    create_user "${usernames[i]}" "${passwords[i]}"
done
