#!/bin/bash

# Check if the script is run as root
if [ "$EUID" -ne 0 ]; then
    echo "Please run this script as root or with sudo."
    exit 1
fi

# Define username and password for Jenkins user
JENKINS_USER="jenkins"
JENKINS_PASSWORD="your_secure_password_here"

# Check if the user already exists
if id "$JENKINS_USER" &>/dev/null; then
    echo "User '$JENKINS_USER' already exists."
    exit 1
fi

# Create Jenkins user
useradd -m -s /bin/bash "$JENKINS_USER"

# Set password for Jenkins user
echo "$JENKINS_USER:$JENKINS_PASSWORD" | chpasswd

# Display information
echo "User '$JENKINS_USER' created successfully."
echo "Password for '$JENKINS_USER' set."

# You may want to perform additional configurations here, such as adding the user to specific groups.
# For example, to add the user to the sudo group:
# usermod -aG sudo "$JENKINS_USER"
