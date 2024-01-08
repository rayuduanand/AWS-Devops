#!/bin/bash

# Check if the script is run with appropriate permissions
if [ "$EUID" -ne 0 ]; then
    echo "Please run this script as root or with sudo."
    exit 1
fi

# Determine the package manager
if command -v apt-get &>/dev/null; then
    package_manager="apt-get"
elif command -v yum &>/dev/null; then
    package_manager="yum"
else
    echo "Unsupported package manager. Please install httpd manually."
    exit 1
fi

# Install httpd
echo "Installing httpd..."
if [ "$package_manager" == "apt-get" ]; then
    $package_manager update
fi
$package_manager install -y httpd

# Start httpd
echo "Starting httpd..."
systemctl start httpd   # For systemd-based systems
# For non-systemd systems, you may need to use:
# service httpd start

# Enable httpd to start on boot
echo "Enabling httpd to start on boot..."
systemctl enable httpd   # For systemd-based systems
# For non-systemd systems, you may need to use:
# chkconfig httpd on

echo "httpd installation completed successfully."
