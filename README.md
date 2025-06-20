These are my personal dotfiles.

## Prerequisites

- GNU Stow
- Neovim
- tmux
- zsh
- bat

```bash
sudo pacman -S stow neovim tmux zsh bat
```

## Installation

```bash
git clone https://github.com/artorias305/dotfiles.git
cd dotfiles
stow .
```

## Uninstall

```bash
stow -D .
```
