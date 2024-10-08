#!/usr/bin/env bash

# If not running interactively, don't do anything
case $- in
*i*) ;;
*) return ;;
esac

# Path to the bash it configuration
export BASH_IT="${HOME}/.bash_it"

# Lock and Load a custom theme file.
# Leave empty to disable theming.
# location /.bash_it/themes/
export BASH_IT_THEME='bobby'

# Some themes can show whether `sudo` has a current token or not.
# Set `$THEME_CHECK_SUDO` to `true` to check every prompt:
#THEME_CHECK_SUDO='true'

# (Advanced): Change this to the name of your remote repo if you
# cloned bash-it with a remote other than origin such as `bash-it`.
# export BASH_IT_REMOTE='bash-it'

# (Advanced): Change this to the name of the main development branch if
# you renamed it or if it was changed for some reason
# export BASH_IT_DEVELOPMENT_BRANCH='master'

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@git.domain.com'

# Don't check mail when opening terminal.
unset MAILCHECK

# Change this to your console based IRC client of choice.
export IRC_CLIENT='irssi'

# Set this to the command you use for todo.txt-cli
export TODO="t"

# Set this to the location of your work or project folders
#BASH_IT_PROJECT_PATHS="${HOME}/Projects:/Volumes/work/src"

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=true
# Set to actual location of gitstatus directory if installed
#export SCM_GIT_GITSTATUS_DIR="$HOME/gitstatus"
# per default gitstatus uses 2 times as many threads as CPU cores, you can change this here if you must
#export GITSTATUS_NUM_THREADS=8

# Set Xterm/screen/Tmux title with only a short hostname.
# Uncomment this (or set SHORT_HOSTNAME to something else),
# Will otherwise fall back on $HOSTNAME.
#export SHORT_HOSTNAME=$(hostname -s)

# Set Xterm/screen/Tmux title with only a short username.
# Uncomment this (or set SHORT_USER to something else),
# Will otherwise fall back on $USER.
#export SHORT_USER=${USER:0:8}

# If your theme use command duration, uncomment this to
# enable display of last command duration.
#export BASH_IT_COMMAND_DURATION=true
# You can choose the minimum time in seconds before
# command duration is displayed.
#export COMMAND_DURATION_MIN_SECONDS=1

# Set Xterm/screen/Tmux title with shortened command and directory.
# Uncomment this to set.
#export SHORT_TERM_LINE=true

# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/djl/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

# (Advanced): Uncomment this to make Bash-it reload itself automatically
# after enabling or disabling aliases, plugins, and completions.
# export BASH_IT_AUTOMATIC_RELOAD_AFTER_CONFIG_CHANGE=1

# Uncomment this to make Bash-it create alias reload.
# export BASH_IT_RELOAD_LEGACY=1

# Load Bash It
source "$BASH_IT"/bash_it.sh

if [[ -r /usr/share/bash-completion/bash_completion ]]; then
    . /usr/share/bash-completion/bash_completion
fi

alias mkdir="mkdir -pv"

if command -v rsync >/dev/null; then
    alias cp="rsync -azvP"
fi

if command -v vim >/dev/null; then
    export EDITOR=vim
fi
if command -v nvim >/dev/null; then
    export EDITOR=nvim
fi

date-changelog() {
    env LC_ALL=C date +'%a, %d %b %Y %T %z'
}

export PATH="$HOME/.local/bin:$PATH"

if test -d ${HOME}/.cargo/bin; then
    export PATH="$HOME/.cargo/bin:$PATH"
fi
if command -v starship >/dev/null; then
    eval "$(starship init bash)"
fi
if command -v eza >/dev/null; then
    alias ls="eza --icons=auto"
    alias l="ls -al"
    alias ll="ls -l"
    alias tree="ls -T"
fi
if command -v bat >/dev/null; then
    alias cat="bat -p"
fi
if command -v zoxide >/dev/null; then
    eval "$(zoxide init bash)"
fi

if command -v fnm >/dev/null; then
    eval "$(fnm env --use-on-cd)"
fi
if test -d /usr/lib/qt6/bin; then
    export PATH="/usr/lib/qt6/bin/:$PATH"
fi
if command -v pyenv >/dev/null; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
fi

if test -d /usr/local/texlive; then
    export MANPATH="/usr/local/texlive/2023/texmf-dist/doc/man:$MANPATH"
    export INFOPATH="/usr/local/texlive/2023/texmf-dist/doc/info:$INFOPATH"
    export PATH="/usr/local/texlive/2023/bin/x86_64-linux:$PATH"
fi
test -f "/usr/share/plantuml/plantuml.jar" && export PLANTUML_JAR="/usr/share/plantuml/plantuml.jar"
test -f "/usr/share/java/plantuml/plantuml.jar" && export PLANTUML_JAR="/usr/share/java/plantuml/plantuml.jar"
if command -v lualatex >/dev/null; then
    alias llatex="lualatex -shell-escape -synctex=1 -interaction=nonstopmode -file-line-error"
fi

