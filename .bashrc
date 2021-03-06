#!/usr/bin/env bash
export GIT_HOSTING='xxzozaxx@github.com'
unset MAILCHECK
export IRC_CLIENT='weechat'
export SCM_CHECK=true

# Add plugin
# source $(dirname $(gem which colorls))/tab_complete.sh

# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

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

source /etc/bash_completion.d/climate_completion
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/master/.sdkman"
[[ -s "/home/master/.sdkman/bin/sdkman-init.sh" ]] && source "/home/master/.sdkman/bin/sdkman-init.sh"
