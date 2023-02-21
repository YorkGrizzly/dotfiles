# For a full list of active aliases, run `alias`.
#
# Example aliases
alias grep='grep --color=always'

alias ls='ls --color'
alias ll='ls -lF'
alias lla='ls -alF'

# folder navigation
alias gtks='cd ~/kosmos'

# List out directory history.
alias dv='dirs -v'

# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
