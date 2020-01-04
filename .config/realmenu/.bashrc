#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='>'

function realmenu() {
    if [ $(echo $BASH_COMMAND | awk '{print $1}') != 'printf' ]
    then
        $BASH_COMMAND </dev/null &>/dev/null &
        exit
    fi
}
trap realmenu DEBUG
