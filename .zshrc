[ -n "$PS1" ] && source ~/.profile

# Append tot he zsh history file, rather than overwriting it.
setopt APPEND_HISTORY

# Peroform full command hashing before attempting spelling correction. 
# Reduces false spell corrections.
setopt HASH_LIST_ALL

# 
setopt AUTO_CD

# A little bit of bashism.
bindkey -e

source ~/.zprompt
