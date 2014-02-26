# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
      . /etc/bashrc
fi

# git completion
source ~/dotfiles/git-completion.bash

# git branch 
function parse_git_dirty {
    [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}

function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}
export PS1='\u@\h \[\033[1;33m\]\w\[\033[0m\]$(parse_git_branch)$ '''

#user specific aliases and functions

#export PS3="\{$(tput setaf 7)\]\u@\h:\w $ \[$(tput sgr0)\]"

alias la='ls -la --color'
alias sc='screen -D -RR'
