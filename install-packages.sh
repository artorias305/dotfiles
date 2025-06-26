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
set -euo pipefail

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

install_if_missing() {
    for pkg in "$@"; do
        if ! pacman -Qi "$pkg" &>/dev/null && ! yay -Qi "$pkg" &>/dev/null; then
            echo "Installing $pkg..."
            yay -S --noconfirm "$pkg"
        else
            echo "$pkg" is already installed
        fi
    done
}

cargo install eza
cargo install starship
cargo install zoxide

# for package in ${packages[@]}; do
#     yay -S --noconfirm ${package}
# done

install_if_missing "${packages[@]}"

read -p "Do you want to install preconfigured dotfiles? (y/n): " choice
if [[ "$choice" =~ ^[Yy]$ ]]; then
    if [ -d "$HOME/dotfiles" ]; then
        cd "$HOME/dotfiles"
        stow .
    else
        echo "Dotfiles directory not found in \$HOME."
    fi
fi

if [[ $SHELL != *zsh ]]; then
    chsh -s "$(which zsh)"
    echo "Default shell changed to zsh. Re-login to apply."
fi

echo "Setting up docker..."
sudo systemctl enable --now docker
sudo usermod -aG docker "$USER"


echo "Setup complete. Consider rebooting your PC."
