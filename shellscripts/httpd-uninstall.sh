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
    echo "Unsupported package manager. Please uninstall httpd manually."
    exit 1
fi

# Uninstall httpd
echo "Uninstalling httpd..."
$package_manager remove -y httpd

# Stop httpd
echo "Stopping httpd..."
systemctl stop httpd   # For systemd-based systems
# For non-systemd systems, you may need to use:
# service httpd stop

# Disable httpd from starting on boot
echo "Disabling httpd from starting on boot..."
systemctl disable httpd   # For systemd-based systems
# For non-systemd systems, you may need to use:
# chkconfig httpd off

echo "httpd uninstallation completed successfully."

