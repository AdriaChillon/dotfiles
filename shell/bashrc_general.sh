
# Expand the history size
export HISTFILESIZE=10000
export HISTSIZE=500

# Don't put duplicate lines in the history and do not add lines that start with a space
export HISTCONTROL=erasedups:ignoredups:ignorespace

export HISTTIMEFORMAT="%F %T "

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
# [ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# enable color support of ls and also add handy aliases
if [[ "$TERM" != "dumb" ]]; then
    if [[ `uname` == "Linux"  ]]; then
        eval "`dircolors -b`"
        alias ls='ls --color=auto'
    else
        alias ls='ls -G'
    fi
fi

# prompt
if [ "$color_prompt" = yes ]; then
    PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='\u@\h:\w\$ '
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
    xterm) color_prompt=yes;;
esac

# Home directory bin apps
export PATH=~/bin:~/.local/bin:$PATH

# local paths
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# Always dump the core
ulimit -c unlimited

# weather function and alias
function _weather()
{
    curl -4 wttr.in/${1:-Reus}
}
alias weather=_weather

# Cleanup PATH
export PATH=$(echo "$PATH" | awk -v RS=':' -v ORS=":" '!a[$1]++{if (NR > 1) printf ORS; printf $a[$1]}')

# ViM
alias vi='vim'
export EDITOR=vim

# Terminal copy & paste
if [[ `uname` != "Darwin"  ]]; then
    alias pbcopy='xclip -in -selection clipboard'
    alias pbpaste='xclip -out -selection clipboard'
fi