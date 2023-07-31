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
sudo apt install -y python3

# Install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Install Nix
sh <(curl -L https://nixos.org/nix/install) --daemon

# Use Nix to install neovim and stuff needed for plugins
nix-env -iA nixpkgs.neovim nixpkgs.gcc nixpkgs.nodejs

####################################
# Install dependencies for content #
####################################

sudo apt install -y ffmpeg
