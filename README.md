# Desktop Ansible Playbook
This playbook is meant to automate the first time setup process for my PCs. It has been specifically written for Fedora. Additionally, it has to be cloned into the exact directory specified below or it will break.

## Libraries
As I'm new to Ansible, I'm going to be installing the libraries into the ```library``` directory and adding it to this repo. This may change in the future as I get better at Ansible.

## Installation
### Ansible
```bash
sudo dnf install ansible
ansible-galaxy collection install community.general
wget https://github.com/Lackshan/desktop-ansible-playbook/archive/refs/heads/master.zip
```

### Playbook
```bash
mkdir -p ~/Projects
cd ~/Projects
git clone git@github.com:Lackshan/desktop-ansible-playbook.git
```

## Running the playbook
```bash
cd ~/Projects/desktop-ansible-playbook
ansible-playbook post_install.yml --ask-become-pass
source /etc/profile
```
## Known Issues
Sometimes, when running the playbook, it fails with "timeout waiting for privilege escalation password prompt". This can be fixed by adding your hostname (Run ```hostname``` in your terminal to find out what it is) to /etc/hosts for both the ```127.0.0.1``` and ```::1``` entries.

## Not included in this playbook
1. Actual creation of SSH Keys
