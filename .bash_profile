alias stree='/Applications/SourceTree.app/Contents/Resources/stree'
alias subl="'/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl'"
alias ls="ls -v"
alias ll="ls -lahv"
alias la="ls -ahv"
alias lla="ls -lahv"

alias work="stree .;subl ."
alias devlog="tail -f log/development.log"
alias finder='open -a Finder'


function parse_git_dirty {
  if [[ $(git status 2> /dev/null | tail -n1) == "nothing to commit, working tree clean" ]]; then
    echo "✔ "
  else
    echo "✘ "
  fi
}

function git_branch {
    ref=$(git symbolic-ref HEAD 2> /dev/null) || return;
    echo "("$(parse_git_dirty)${ref#refs/heads/}") ";
}

PATH=$HOME/bin:/usr/local/bin:$PATH

PS1="[\[\033[1;32m\]\w\[\033[0m\]] \[\033[0m\]\[\033[1;36m\]\$(git_branch)\[\033[0;33m\]\\[\033[0m\]♨  "


# Enable tab completion
source ~/git-completion.bash

# colors!
green="\[\033[0;32m\]"
blue="\[\033[0;34m\]"
purple="\[\033[0;35m\]"
