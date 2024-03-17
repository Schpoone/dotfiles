#!/bin/bash
########################################################################
# Install script to setup my dev environment from base Debian Bullseye #
# Run this from this directory                                         #
########################################################################

set -euo pipefail

sudo apt update && sudo apt upgrade

# Install my essential packages
sudo apt install -y git man

# Install basic utilities
sudo apt install -y tmux zip unzip gpg xz-utils build-essential curl

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

# Copy other config files to correct places
# TODO: Use GNU stow to symlink these instead of copying them directly
cp gitconfig ~/.gitconfig
cp bashrc ~/.bashrc
cp -r config/lazygit ~/.config/lazygit

# Install Nix
sh <(curl -L https://nixos.org/nix/install) --no-daemon

# Use Nix to install neovim and stuff needed for plugins
. ~/.nix-profile/etc/profile.d/nix.sh
nix-env -iA nixpkgs.neovim nixpkgs.gcc nixpkgs.nodejs

# Install NvChad and configure
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
cp -r config/nvim ~/.config/nvim/lua/custom

# Install TPM for tmux config
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm

# Configure tmux
cp config/tmux/tmux.conf ~/.config/tmux/tmux.conf
ln -s ~/.config/tmux/tmux.conf ~/.tmux.conf
bash ~/.config/tmux/plugins/tpm/bin/install_plugins

####################################
# Install dependencies for content #
####################################

sudo apt install -y ffmpeg yt-dlp expect
