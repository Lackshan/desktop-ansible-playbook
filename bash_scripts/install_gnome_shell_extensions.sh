#!/usr/bin/env bash

# Adapted from https://codereview.stackexchange.com/questions/243133/installing-gnome-extension-via-cli

# TODO:
#  1) Download into tmp instead
#  2) Accept shell url as argument and install that
#  3) Update playbook to install all extensions

# Install a target gnome shell extension defined via url

set -euo pipefail

store_url="https://extensions.gnome.org/extension-data"
extensions_path="$HOME/.local/share/gnome-shell/extensions/"
zip="gnome-extension.zip"

cd "$(xdg-user-dir DOWNLOAD)"
wget "$store_url/$1" -O "$zip"
trap 'rm "$zip"' ERR INT TERM EXIT

uuid=$(unzip -c "$zip" metadata.json | grep uuid | cut -d \" -f4)

if [[ ! -d "$extensions_path/$uuid" ]]; then
    mkdir "$extensions_path/$uuid"
    unzip -q "$zip" -d "$extensions_path/$uuid"
    gnome-shell-extension-tool -e "$uuid"
fi

gnome-shell --replace &