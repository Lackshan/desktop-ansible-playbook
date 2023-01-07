#!/bin/bash

# This script must be run as root
# Any lines starting with 'sudo -u USERNAME' will be run by USERNAME
# Other lines will be run as root

# Check that script is being run as root
[[ $EUID -ne 0 ]] && echo "This script must be run as root." && exit 1

# Download Mullvad RPM file from offical website
sudo -u lackshan wget -P /tmp --content-disposition https://mullvad.net/download/app/rpm/latest
rpm_filename=$(sudo -u lackshan find /tmp -maxdepth 1 -name 'MullvadVPN-*_x86_64.rpm')

# Download Mullvad RPM file GPG signature from offical website
sudo -u lackshan wget -P /tmp --trust-server-names https://mullvad.net/download/app/rpm/latest/signature
sig_filename=$(sudo -u lackshan find /tmp -maxdepth 1 -name 'MullvadVPN-*_x86_64.rpm.asc')

verify_signature() {
    local file=$1 out=
    # --status-fd 1 makes gpg print machine readable output
    if out=$(sudo -u lackshan gpg --status-fd 1 --verify "$file" 2>/dev/null) &&
       echo "$out" | grep -qs "^\[GNUPG:\] VALIDSIG "; then
        return 0
    else
        echo "$out" >&2
        return 1
    fi
}

# Verify signature
if verify_signature $sig_filename; then
    # Install/Update Mullvad
    dnf install -y $rpm_filename
else
    echo "Invalid GPG signature. Aborting install!"
fi
