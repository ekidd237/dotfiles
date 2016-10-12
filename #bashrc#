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

#history
export HISTTIMEFORMAT="%h/%d - %H:%M:%S "

#user specific aliases and functions
alias ls='ls -F --color=auto'
alias la='ls -lah --color'
alias sc='screen -D -RR'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

#git aliases
alias gs="git status"
alias gc="git commit"
alias gr="git checkout"
alias ga="git add"
alias gl="git lola"

# php style fixer
alias phpfix="php /usr/local/bin/php-cs-fixer fix"
alias worker="/usr/bin/php /home/eschmidt/gearman-workers/opt/css/gearman_workers/report/worker"
