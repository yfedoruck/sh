#fix terminal bug. new tab in cwd
#. /etc/profile.d/vte.sh


if [ -f ~/.aliases ]; then
    . ~/.aliases
fi


# x=$(git symbolic-ref --short -q HEAD) && echo ${x/feature\//}
# PS1='\[\e[1;31m\][\A]\[\e[1;33m\]\u\[\e[1;35m\]:\[\e[1;34m\]\w\$\[\e[0m\] '
export PS1='\[\e[1;31m\][\A]\[\e[1;33m\]\u\[\e[1;35m\]:\[\e[1;34m\]\w\[\033[01;32m\]$(__git_ps1)\[\033[01;34m\]\$\[\033[00m\] '
PATH=$PATH:/home/slava/bin
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=$PATH:$HOME/node_modules/.bin
PATH=$PATH:$HOME/.rvm/bin/rvm
PATH=$PATH:$HOME/.composer/vendor/bin
#echo "keycode 14 = BackSpace" | loadkeys
#gvim () { command gvim --remote-silent "$@" || command gvim "$@"; 
NODE_PATH=/usr/lib/node_modules
#export JAVA_HOME=/usr
JAVA_HOME=/usr/lib/jvm/java-8-oracle
OWTEST_READ_TIMEOUT=20000000000

#set vim as default editor
export VISUAL=vim
export EDITOR="$VISUAL"

#jetty web-server
JETTY_HOME=/home/slava/www/jetty

#devilspie
devilspie &

#tmux
[ -z "$TMUX" ] && export TERM=xterm-256color


fh() {
  eval $(history | fzf +s | sed 's/ *[0-9]* *//')

}

export FZF_DEFAULT_OPTS='
  --extended-exact
  --bind ctrl-f:page-down,ctrl-b:page-up
  --no-sort
'

alias fzf='fzf --bind "enter:execute(less {})"'
fd() {
  local dir
  dir=$(find ${1:-*} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"

alias ..='cd ../'
}

#FZF_DEFAULT_COMMAND="eval $(history | fzf +s | sed 's/ *[0-9]* *//')"
PGPASSWORD=gthcgtrnbdf
alias lock='i3lock -c000000'
