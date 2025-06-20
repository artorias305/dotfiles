setopt autocd
setopt correct
setopt histignoredups
setopt share_history

export PATH="$HOME/.cargo/bin:$HOME/bin:/usr/local/bin:/usr/bin:/bin:$PATH"

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

eval "$(starship init zsh)"
