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

#etl aliases
alias etl_files='sudo sftp -i /opt/css/css-etl/config/keys/css_sftp.pem testAccount@sftp2.internal.csshealth.com'
alias qa_file='./bin/ingest --qa --file-id <file_id_from_list_source_checks> -d'

#git aliases
alias gs="git status"
alias gc="git commit"
alias gr="git checkout"
alias ga="git add"
alias gl="git lola"

# php style fixer
alias phpfix="php /usr/local/bin/php-cs-fixer fix"

# dev-link and composer stuff
alias devlink="sudo dev-link;
                cd /var/web/core;
                sudo composer update && sudo composer dump-autoload -o;
                cd -"

# start report worker               
alias report_worker="/home/eschmidt/repos/gearman_workers/opt/css/gearman_workers/report/worker"

# start process runner orchestrator
alias process_runner_orchestrator="/usr/bin/php /home/eschmidt/repos/gearman_workers/opt/css/gearman_workers/process_runner_orchestrator/mtmpath/worker"

# start process runner worker
alias process_runner_workers="echo {1..20} | xargs -n1 echo | xargs -I'{}' -P10 /usr/bin/php /home/eschmidt/repos/gearman_workers/opt/css/gearman_workers/process_runner/mtmpath/worker"

# stop apache
alias apachestop="sudo /etc/init.d/httpd stop"

# start apache
alias apachestart="sudo /etc/init.d/httpd start"

# etl app start
alias etlappstart="sudo ./bin/app.pl --port 80"

# etl workers
alias etlworker="./bin/gearman-workers -f"

# etl test config
alias testconfig="./bin/testconfig  -f "

# view apache logs
alias apachelog="clear;
                sudo tail -20 /var/log/httpd/error_ssl.log"

# unit testing
alias test="phpunit --coverage-text --colors -c unittests/phpunit.xml "
alias test_html="phpunit --coverage-html ~/repos/coverage -c unittests/phpunit.xml unittests/"

# masterbate
alias masterbate="cd ~/repos/api-authz; git checkout master; git pull; sudo dev-link; 
                  cd ~/repos/api-pathfinder-patient; git checkout master; git pull; sudo dev-link;
                  cd ~/repos/app-auth; git checkout master; git pull; sudo dev-link;
                  cd ~/repos/css-etl; git checkout master; git pull; sudo dev-link;
                  cd ~/repos/css-gearman; git checkout master; git pull; sudo dev-link;
                  cd ~/repos/api-config; git checkout master; git pull; sudo dev-link;
                  cd ~/repos/api-pathfinder-platform; git checkout master; git pull; sudo dev-link;
                  cd ~/repos/app-core; git checkout master; git pull; sudo dev-link;
                  cd ~/repos/css-etl-api; git checkout master; git pull; sudo dev-link;
                  cd ~/repos/database; git checkout master; git pull; sudo dev-link;
                  cd ~/repos/gearman_workers; git checkout master; git pull; sudo dev-link;
                  cd ~/repos/api-list; git checkout master; git pull; sudo dev-link;
                  cd ~/repos/app-admin; git checkout master; git pull; sudo dev-link;
                  cd ~/repos/app-mtmpath; git checkout master; git pull; sudo dev-link;
                  cd ~/repos/css-etl-web; git checkout master; git pull; sudo dev-link;
                  cd ~/repos/data-update; git checkout master; git pull; sudo dev-link;
                  cd ~/repos/lib-mtm; git checkout master; git pull; sudo dev-link;
                  cd ~/repos/utilities; git checkout master; git pull; sudo dev-link;
                  cd ~/repos/www; git checkout master; git pull;
                  cd ~/repos; ctags -R --fields=+aimlS --languages=php;
                  "
# powerline
if [ -d "$HOME/.local/bin" ]; then
        PATH="$HOME/.local/bin:$PATH"
fi


PATH="/home/eschmidt/perl5/bin${PATH+:}${PATH}"; export PATH;
PERL5LIB="/home/eschmidt/perl5/lib/perl5${PERL5LIB+:}${PERL5LIB}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/eschmidt/perl5${PERL_LOCAL_LIB_ROOT+:}${PERL_LOCAL_LIB_ROOT}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/eschmidt/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/eschmidt/perl5"; export PERL_MM_OPT;
