# Bash Scripts
A collection of useful scripts to automate things like updating or installing applications.

## Update Scripts
### update_tutanota.sh
As Tutanota's Linux client is only available as an AppImage, updating must be done manually. This script downloads the AppImage into /tmp and then copies it to /opt/tutanota. It must be run as root.

Run it with: 
```bash
sudo ~/Projects/desktop-ansible-playbook/bash_scripts/update_tutanota.sh
```

### update_mullvad.sh
Mullvad provides an RPM file which has to be installed and updated manually. This script downloads the latest RPM file to /tmp, checks it's GPG signature and then installs it (if the signature checks out).

Run it with:
```bash
~/Projects/desktop-ansible-playbook/bash_scripts/update_mullvad.sh
```
