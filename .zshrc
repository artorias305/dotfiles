setopt autocd
setopt correct
setopt histignoredups
setopt share_history

export PATH="$HOME/.cargo/bin:$HOME/bin:/usr/local/bin:$HOME/.local/bin:/usr/bin:/bin:$PATH"

autoload -Uz compinit
compinit

source ~/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh-autosuggestions/zsh-autosuggestions.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias ll="eza -l -g --icons"
alias lla="ll -a"
alias vim="nvim"
alias g="git"
alias grep="grep --color=auto"
alias lg="lazygit"
alias cat="bat"
alias fetch="nerdfetch"
alias symlink="ln -s"
alias tree="tree -C"

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
