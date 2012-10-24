# ~/.profile: excuted by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login 
# exists.

# the default umask is set in /etc/profile; for setting hte umask
# for ssh logins, install and configure the libpam-umask package.
umask u=rwx,g=rx,o=

# Add ~/bin to the $PATH
export PATH="${HOME}/bin:${PATH}"

# Load additional dotfiles:
# * ~/.path can be used to extend $PATH.
# * ~/.extra can be used for other settings you don't want to commit.
for file in ~/.{path,prompt,exports,aliases,functions,extra}; do
    [ -r "$file" ] && source "$file"
done
unset file

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

# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "${HOME}/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh

# If possible, add tab completion for other commands
[ -f /etc/bash_completion ] && source /etc/bash_completion
