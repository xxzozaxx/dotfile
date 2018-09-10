#!/bin/bash
#  ____             __ _ _
# |  _ \ _ __ ___  / _(_) | ___
# | |_) | '__/ _ \| |_| | |/ _ \
# |  __/| | | (_) |  _| | |  __/:Ahmed Khaled:
# |_|   |_|  \___/|_| |_|_|\___|:ahmed_khaledATzohoDoTCoM:
## ┏┓╻╻ ╻
## ┃┗┫╺╋╸
## ╹ ╹╹ ╹

# ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••
# ––––––––––––––––––––––––––––––––––– BASH –––––––––––––––––––––––––––––––––––
# ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••
# Load bashrc
[[ -f ~/.bashrc ]] && . ~/.bashrc

# startx when login to tty 1
if [ -z "$DISPLAY" ] && [ "$(fgconsole)" -eq 1 ]; then
	startx
fi

# ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••
# ––––––––––––––––––––––––––––––––– Programs –––––––––––––––––––––––––––––––––
# ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••
#gpg
GPG_TTY=$(tty)
export GPG_TTY
# if [ -z "$GPG_AGENT_INFO" ]; then
#     eval "$(gpg-agent --daemon --options ~/.gnupg/gpg-agent.conf)"
# fi
_byobu_sourced=1 . /usr/bin/byobu-launch 2>/dev/null || true

# ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••
# ––––––––––––––––––––––––––––––– Language PATH ––––––––––––––––––––––––––––––
# ••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••

# export PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"
if [ -e /home/master/.nix-profile/etc/profile.d/nix.sh ]; then . /home/master/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

export PATH="$HOME/.cargo/bin:$PATH"
