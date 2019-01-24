#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# path & variable
export ANDROID_HOME=${HOME}/Android/Sdk
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk
export PATH=${HOME}/scripts:$PATH
export PATH="/usr/lib/ccache/bin/:$PATH"

# history
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# tab autocomplete
bind 'TAB:menu-complete'
bind 'set show-all-if-ambiguous on'
bind "set menu-complete-display-prefix on"

# ignore case-sensitive
bind 'set completion-ignore-case on'

source ${HOME}/dotfiles/common
source /usr/share/bash-completion/bash_completion
