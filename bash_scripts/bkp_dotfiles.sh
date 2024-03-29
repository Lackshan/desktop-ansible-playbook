#!/bin/bash
# Backup Dotfiles
# This script is meant to copy all dotfiles into a git repo so that they can be backed up and easily installed later (with the 'dl_dotfiles.sh' script)
# Make sure that git is setup with appropriate ssh keys!

# Ensure git repo is cloned:
git clone git@github.com:Lackshan/dotfiles.git ~/Projects/dotfiles

# Zsh:
mkdir ~/Projects/dotfiles/zsh
cp ~/.zshrc ~/Projects/dotfiles/zsh/.zshrc
cp ~/.p10k.zsh ~/Projects/dotfiles/zsh/.p10k.zsh

# Kitty:
mkdir ~/Projects/dotfiles/kitty
mkdir ~/Projects/dotfiles/kitty/sessions
cp ~/.config/kitty/kitty.conf ~/Projects/dotfiles/kitty/kitty.conf
cp ~/.config/kitty/current-theme.conf ~/Projects/dotfiles/kitty/current-theme.conf
cp ~/.config/kitty/start_session.py ~/Projects/dotfiles/kitty/start_session.py
cp -a ~/.config/kitty/sessions/ ~/Projects/dotfiles/kitty/sessions/

# TLP:
# Only do if TLP is installed!
# mkdir ~/Projects/dotfiles/tlp
# cp /etc/tlp.conf ~/Projects/dotfiles/tlp/tlp.conf
