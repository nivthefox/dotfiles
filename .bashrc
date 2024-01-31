[ -n "$PS1" ] && source ~/.profile

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the bash history file, rather than overwriting it.
shopt -s histappend

# Autocorrect typos in path names when using cd
shopt -s cdspell

# Enable some Bash 4 features when possible:
# * autocd, e.g. **/qux will enter ./foo/bar/qux
# * Recursive globbing, e.g. echo **/*.txt
shopt -s autocd 2> /dev/null
shopt -s globstar 2> /dev/null

source .prompt
