# Desktop Ansible Playbook
This playbook is meant to automate the first time setup process for my PCs. It has been specifically written for Fedora.

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

## Not included in this playbook
1. Actual creation of SSH Keys
