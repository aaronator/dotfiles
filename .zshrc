source "${HOME}/.zgen/zgen.zsh"

zgen load chrissicool/zsh-256color
zgen load zsh-users/zsh-syntax-highlighting
zgen load zsh-users/zsh-autosuggestions

# Source colors for ls
LS_COLORS=…
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
if whence dircolors >/dev/null; then
  export LS_COLORS
  alias ls='ls --color'
else
  export CLICOLOR=1
  LSCOLORS=…
fi

#export PATH="/usr/local/bin:/apollo/env/SDETools/bin:$PATH"
#export PATH="/Users/aarolamb/Library/Python/3.6/bin/:$PATH"

alias ll="ls -Alh"
alias odin="ssh -fNL 2009:localhost:2009 aarolamb.aka.corp.amazon.com"

# VIM
alias vim='nvim'
alias ivm='vim'
alias vm='nvim'
alias vi='nvim'

