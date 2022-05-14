#!/bin/bash

# This script must be run as root
# Any lines starting with 'sudo -u USERNAME' will be run by USERNAME
# Other lines will be run as root

# Check that script is being run as root
[[ $EUID -ne 0 ]] && echo "This script must be run as root." && exit 1

# Download Tutanota AppImage from offical website
sudo -u lackshan wget -P /tmp "https://mail.tutanota.com/desktop/tutanota-desktop-linux.AppImage"
# Move to opt
mv /tmp/tutanota-desktop-linux.AppImage /opt/tutanota/tutanota-desktop-linux.AppImage
# Make it executable
sudo -u lackshan chmod +x /opt/tutanota/tutanota-desktop-linux.AppImage
