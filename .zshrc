# Path to your oh-my-zsh installation.
export ZSH="/home/master/.oh-my-zsh"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="purity"
CASE_SENSITIVE="true"
ENABLE_CORRECTION="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(
    git
    sudo
    colored-man-pages
)

source $ZSH/oh-my-zsh.sh
# User configuration
export MANPATH="/usr/local/man:$MANPATH"

# Fbterm config
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

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
alias preview="fzf --preview 'bat --color \"always\" {}'"
# add support for ctrl+o to open selected file in VS Code
export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(code {})+abort'"

#PATH
export PATH=$PATH:$HOME/.go/bin:$(ruby -e 'print Gem.user_dir')/bin:/home/master/.local/bin/
export PATH="$HOME/.cargo/bin:$PATH" # rust
export PATH="$HOME/bin:$PATH" # mine packages
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

source /etc/bash_completion.d/climate_completion
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/master/.sdkman"
[[ -s "/home/master/.sdkman/bin/sdkman-init.sh" ]] && source "/home/master/.sdkman/bin/sdkman-init.sh"
