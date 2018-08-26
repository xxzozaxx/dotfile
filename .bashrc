#!/usr/bin/env bash

# Path to the bash it configuration
export BASH_IT="/home/master/.bash_it"


# Lock and Load a custom theme file
# location /.bash_it/themes/
## to preview them https://github.com/Bash-it/bash-it/wiki/Themes
export BASH_IT_THEME='purity'
# export BASH_IT_THEME='90210'

# (Advanced): Change this to the name of your remote repo if you
# cloned bash-it with a remote other than origin such as `bash-it`.
# export BASH_IT_REMOTE='bash-it'

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='xxzozaxx@github.com'

# Don't check mail when opening terminal.
unset MAILCHECK

# Change this to your console based IRC client of choice.
#export IRC_CLIENT='weechat'

# Set this to the command you use for todo.txt-cli
#export TODO="t"

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=true

# Set Xterm/screen/Tmux title with only a short hostname.
# Uncomment this (or set SHORT_HOSTNAME to something else),
# Will otherwise fall back on $HOSTNAME.
# export SHORT_HOSTNAME=$(hostname -s)

# Set Xterm/screen/Tmux title with only a short username.
# Uncomment this (or set SHORT_USER to something else),
# Will otherwise fall back on $USER.
# export SHORT_USER=${USER:0:8}

# Set Xterm/screen/Tmux title with shortened command and directory.
# Uncomment this to set.
# export SHORT_TERM_LINE=true

# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/djl/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

# (Advanced): Uncomment this to make Bash-it reload itself automatically
# after enabling or disabling aliases, plugins, and completions.
# export BASH_IT_AUTOMATIC_RELOAD_AFTER_CONFIG_CHANGE=1

# Add plugin
# source $(dirname $(gem which colorls))/tab_complete.sh
source ~/.bash_it/custom/h.sh

# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

# Load Bash It
source "$BASH_IT"/bash_it.sh

# Console fbterm config
case "$TERM" in
    xterm*)
        if [ -e /usr/share/terminfo/x/xterm-256color ]; then
            export TERM=xterm-256color
        elif [ -e /usr/share/terminfo/x/xterm-color ]; then
            export TERM=xterm-color;
        else
            export TERM=xterm
        fi
        ;;
    linux)
        [ -n "$FBTERM" ] && export TERM=fbterm
        ;;
esac

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# programs
export PAGER=less
export BROWSERCLI=links2
export READER=zathura
export IMAGEVIEWER=meh
export VIDEOPLAYER=mpv
export EDITOR=emacsclient
export BROWSER=conkeror

#Ruby
export GEM_HOME=$HOME/.gem

#GO
export GOROOT=$HOME/.go
export GOPATH=$HOME/.go/pkg

#PATH
export PATH=$PATH:$HOME/.go/bin:$(ruby -e 'print Gem.user_dir')/bin:/home/master/.local/bin/
export PATH="$HOME/.cargo/bin:$PATH" # rust
