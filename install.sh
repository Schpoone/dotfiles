#!/bin/bash

########################################################################
# Install script to setup my dev environment from base Debian Bullseye #
########################################################################

sudo apt update && sudo apt upgrade

# Install my essential packages
sudo apt install -y git man

# Install basic utilities
sudo apt install -y neovim tmux zip unzip gpg

# Install languages
sudo apt install -y python3
