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
eval `keychain --agents ssh --eval id_rsa`

# generic colouriser
GRC=`which grc`
if [ "$TERM" != dumb ] && [ -n "$GRC" ]
    then
        alias colourify="$GRC -es --colour=auto"
        alias configure='colourify ./configure'
        for app in {diff,make,gcc,g++,ping,traceroute}; do
            alias "$app"='colourify '$app
    done
fi

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
PATH="${BREW_PREFIX}/opt/coreutils/bin:$PATH"
PATH="${BREW_PREFIX}/opt/gnu-sed/bin:$PATH"
PATH="${BREW_PREFIX}/opt/gnu-tar/bin:$PATH"
PATH="${BREW_PREFIX}/opt/grep/bin:$PATH"
PATH="${BREW_PREFIX}/opt/make/bin:$PATH"
export MANPATH="${BREW_PREFIX}/opt/coreutils/bin/gnuman:$MANPATH"

##
## gotta tune that bash_history…
##

# timestamps for later analysis. www.debian-administration.org/users/rossen/weblog/1
export HISTTIMEFORMAT='%F %T '

# keep history up to date, across sessions, in realtime
#  http://unix.stackexchange.com/a/48113
export HISTCONTROL=ignoredups:erasedups         # no duplicate entries
export HISTSIZE=1000000                          # big big history (default is 500)
export HISTFILESIZE=$HISTSIZE                   # big big history
type shopt &> /dev/null && shopt -s histappend  # append to history, don't overwrite it

##
## Completion…
##

if [[ -n "$ZSH_VERSION" ]]; then  # quit now if in zsh
    return 1 2> /dev/null || exit 1;
fi;

# bash completion.
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

if  which brew > /dev/null && [ -f "${BREW_PREFIX}/share/bash-completion/bash_completion" ]; then
    source "${BREW_PREFIX}/share/bash-completion/bash_completion"
elif [ -f /etc/bash_completion ]; then
    source /etc/bash_completion;
fi;

# homebrew completion
if  which brew > /dev/null; then
    source "${BREW_PREFIX}/etc/bash_completion.d/brew"
fi;

# hub completion
if  which hub > /dev/null; then
    source "${BREW_PREFIX}/etc/bash_completion.d/hub.bash_completion.sh"
fi;

# vagrant completion
if [ -f ${BREW_PREFIX}/etc/bash_completion.d/vagrant ]; then
    source ${BREW_PREFIX}/etc/bash_completion.d/vagrant
fi

# Enable tab completion for `g` by marking it as an alias for `git`
if type __git_complete &> /dev/null; then
    __git_complete g __git_main
fi;

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;
