#!/bin/bash

packages=(
    htop
    btop
    neovim
    vim
    visual-studio-code-bin
    spotify
    bat
    nodejs
    npm
    python
    go
    tmux
    git
    stow
    zsh
    lazygit
    fzf
    curl
    wget
    unzip
    zip
    yazi
    starship
    ghostty
    vlc
    gimp
    ttf-jetbrains-mono-nerd
    docker
)

echo "Starting system setup..."

echo "Updating system..."
sudo pacman -Syu --noconfirm

if ! command -v yay &> /dev/null; then
    echo "Installing yay AUR helper..."
    sudo pacman -S --needed git base-devel --noconfirm
    git clone https://aur.archlinux.org/yay.git
    cd yay
    echo "Building yay..."
    makepkg -si --noconfirm
    cd ..
    rm -rf yay
else
    echo "yay is already installed"
fi

for package in ${packages[@]}; do
    yay -S --noconfirm ${package}
done

echo "Setting up docker"

sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker $USER
newgrp docker
