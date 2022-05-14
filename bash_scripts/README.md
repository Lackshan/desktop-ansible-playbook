# Bash Scripts
A collection of useful scripts to automate things like updating or installing applications.

## Update Scripts
### update_tutanota.sh
As Tutanota's Linux client is only available as an AppImage, updating must be done manually. This script downloads the AppImage into /tmp and then copies it to /opt/tutanota. It must be run as root.

Run it with: 
```bash
sudo ~/Projects/desktop-ansible-playbook/bash_scripts/update_tutanota.sh
```
