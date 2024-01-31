# ~/.profile: excuted by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login 
# exists.

# the default umask is set in /etc/profile; for setting hte umask
# for ssh logins, install and configure the libpam-umask package.
umask u=rwx,g=rx,o=

# Load additional dotfiles:
# * ~/.path can be used to extend $PATH.
# * ~/.extra can be used for other settings you don't want to commit.
for file in ~/.{path,exports,aliases,functions,extra}; do
    [ -r "$file" ] && source "$file"
done
unset file

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "${HOME}/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh

# If possible, add tab completion for other commands
[ -f /etc/bash_completion ] && source /etc/bash_completion

# Load homebrew if present
[ -s "/opt/homebrew/bin/brew" ] && eval "$(/opt/homebrew/bin/brew shellenv)"
