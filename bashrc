# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
      . /etc/bashrc
fi

#user specific aliases and functions

export PS3="\{$(tput setaf 7)\]\u@\h:\w $ \[$(tput sgr0)\]"

alias la='ls -la --color'

