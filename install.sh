#!/bin/bash

########################################################################
# Install script to setup my dev environment from base Debian Bullseye #
########################################################################

sudo apt update && sudo apt upgrade

# Install my essential packages
sudo apt install -y git man

# Install basic utilities
sudo apt install -y tmux zip unzip gpg xz-utils build-essential

# Install languages from apt
sudo apt install -y python3 python3-pip

# Install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Install lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
rm lazygit lazygit.tar.gz

# Install Nix
sh <(curl -L https://nixos.org/nix/install) --no-daemon

# Use Nix to install neovim and stuff needed for plugins
nix-env -iA nixpkgs.neovim nixpkgs.gcc nixpkgs.nodejs

####################################
# Install dependencies for content #
####################################

sudo apt install -y ffmpeg
