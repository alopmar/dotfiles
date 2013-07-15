# Tell grep to highlight matches
export GREP_OPTIONS='--color=auto'
# enables color in the terminal bash shell
export CLICOLOR=1
# sets up the color scheme for list
export LSCOLORS=gxfxcxdxbxegedabagacad
# enables color for iTerm
export TERM=xterm-color
# Color Prompt
export PS1="\[\e[36;1m\]\u@netstak\[\e[32;1m\]\w> \[\e[0m\]" 
# sets up proper alias commands when called
alias ls='ls -G'
alias ll='ls -hl'
export PATH="$PATH:/usr/local/sbin"
