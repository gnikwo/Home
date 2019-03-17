#Correcting backspace problems
export TERM=linux

# Lines configured by zsh-newuser-install
HISTFILE=~/.history
HISTSIZE=40000
SAVEHIST=40000
setopt appendhistory autocd extendedglob nomatch notify hist_ignore_all_dups hist_ignore_space clobber COMPLETE_ALIASES
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/nabos/.zshrc'
autoload -Uz compinit
compinit
# End of lines added by compinstall


zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BNo matches found%b'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh_cache
zstyle ':completion:*' menu select
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

fpath=(~/.zsh/functions $fpath)

autoload -U promptinit
promptinit
prompt nabos

fpath=(~/.zsh/completions $fpath)
autoload -U compinit && compinit

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

# Set title to GNU screen/byobu tab
settitle() {
    if [ "$TERM" = "screen" ];
    then
        printf "\033k$1\033\\";
    fi
}

# Set title when sshing within a tab to some host
ssh() {
    host=$(echo "$*" | sed "s/^.\+@\([^ ]\+\)[ \n]*.*/\1/")
    settitle $host
    command ssh "$@"
    settitle $(hostname)
}

export INCLUDEOS_PREFIX=~/includeos/
export PATH=$PATH:$INCLUDEOS_PREFIX/bin

source ~/.aliases

if [ -r ~/.aliases.local ]; then
    source ~/.aliases.local
fi

if [ -r ~/.zshrc.local ]; then
    source ~/.zshrc.local
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
