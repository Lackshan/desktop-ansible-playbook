#!/bin/bash

# This script must be run as root
# Any lines starting with 'sudo -u USERNAME' will be run by USERNAME
# Other lines will be run as root

# Check that script is being run as root
[[ $EUID -ne 0 ]] && echo "This script must be run as root." && exit 1

# Download Mullvad RPM file from offical website
sudo -u lackshan wget -P /tmp --content-disposition https://mullvad.net/download/app/rpm/latest
rpm_filename=$(find /tmp -maxdepth 1 -name 'MullvadVPN-*_x86_64.rpm')

# Download Mullvad RPM file GPG signature from offical website
sudo -u lackshan wget -P /tmp --trust-server-names https://mullvad.net/download/app/rpm/latest/signature
sig_filename=$(find /tmp -maxdepth 1 -name 'MullvadVPN-*_x86_64.rpm.asc')

# Verify signature
gpg --verify $sig_filename

# https://mullvad.net/en/help/verifying-signatures/
# Check that the output starts with

# assuming signed data in '{Filename of installer you want to verify}'

# and ends with

# Good signature from "Mullvad (code signing) <admin@mullvad.net>".

# Install RPM
# dnf install -y $rpm_filename
