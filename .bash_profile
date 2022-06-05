# Load our dotfiles like ~/.bash_prompt, etc…
#   ~/.extra can be used for settings you don’t want to commit,
#   Use it to configure your PATH, thus it being first in line.
for file in ~/.{bash_prompt,exports,aliases,functions,extra}; do
    [ -r "$file" ] && source "$file"
done
unset file

# to help sublimelinter etc with finding my PATHS
case $- in
   *i*) [ -r "~/.extra" ] && source ~/.extra
esac

# keychain, so we do not need to enter the passphrase each time
eval `keychain --agents ssh --eval id_rsa id_rsa_gmail`

# highlighting inside manpages and elsewhere
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

export PATH=~/bin:~/.composer/vendor/bin:~/go/bin:$PATH

##
# GNU Binaries

# gnu tools we want!!
export PATH

PATH="${BREW_PREFIX}/opt/coreutils/libexec/gnubin:$PATH"
PATH="${BREW_PREFIX}/opt/gnu-sed/libexec/gnubin:$PATH"
PATH="${BREW_PREFIX}/opt/gnu-tar/libexec/gnubin:$PATH"
PATH="${BREW_PREFIX}/opt/gnu-time/libexec/gnubin:$PATH"
PATH="${BREW_PREFIX}/opt/grep/libexec/gnubin:$PATH"
PATH="${BREW_PREFIX}/opt/make/libexec/gnubin:$PATH"
PATH="${BREW_PREFIX}/opt/gnu-units/libexec/gnubin:$PATH"
PATH="${BREW_PREFIX}/opt/python@3.9/libexec/bin:$PATH"
PATH="$HOME/.cargo/bin:$PATH"
PATH="/usr/local/opt/ruby/bin:$PATH"
PATH="$(gem env gemdir)/bin:$PATH"

export MANPATH="${BREW_PREFIX}/opt/coreutils/libexec/gnuman:$MANPATH"

##
## gotta tune that bash_history…
##

# timestamps for later analysis. www.debian-administration.org/users/rossen/weblog/1
export HISTTIMEFORMAT='%F %T '

# keep history up to date, across sessions, in realtime
#  http://unix.stackexchange.com/a/48113
export HISTCONTROL=ignoredups:erasedups # no duplicate entries
export HISTSIZE=1000000                 # big big history (default is 500)
export HISTFILESIZE=$HISTSIZE           # big big history

##
## Completion…
##

if [[ -n "$ZSH_VERSION" ]]; then  # quit now if in zsh
    return 1 2> /dev/null || exit 1;
fi;

# bash completion.
if [[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]]; then
    . "/usr/local/etc/profile.d/bash_completion.sh"
else
    echo "Failed to load bash completion" >&2
fi

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# append to history, don't overwrite it
shopt -s histappend
