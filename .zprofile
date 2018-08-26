
#  ____             __ _ _
# |  _ \ _ __ ___  / _(_) | ___
# | |_) | '__/ _ \| |_| | |/ _ \
# |  __/| | | (_) |  _| | |  __/:Ahmed Khaled:
# |_|   |_|  \___/|_| |_|_|\___|:ahmed_khaledATzohoDoTCoM:
## ┏┓╻╻ ╻
## ┃┗┫╺╋╸
## ╹ ╹╹ ╹

if [ -z "$DISPLAY" ] && [ "$(fgconsole)" -eq 1 ]; then
    startx
fi

GPG_TTY=$(tty)
export GPG_TTY
# if [ -z "$GPG_AGENT_INFO" ]; then
#     eval "$(gpg-agent --daemon --options ~/.gnupg/gpg-agent.conf)"
# fi
_byobu_sourced=1 . /usr/bin/byobu-launch 2>/dev/null || true

# Ruby
# export GEM_HOME=$HOME/.gem

# Python
# export PATH=$PATH:/home/master/.local/bin/

# GO home and bin
# export GOROOT=$HOME/go
# export PATH=$PATH:$GOROOT/bin

# export PATH=$PATH:$HOME/go/bin:$(ruby -e 'print Gem.user_dir')/bin:/home/master/.local/bin/
