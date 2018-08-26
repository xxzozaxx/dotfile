# You can put files here to add functionality separated per file, which
# will be ignored by git.
# Files on the custom/ directory will be automatically loaded by the init
# script, in alphabetical order.

# For example: add yourself some shortcuts to projects you often work on.
#
# brainstormr=~/Projects/development/planetargon/brainstormr
# cd $brainstormr
#

# better view
alias cp='cp -iv'         # Preferred 'cp' implementation
alias mv='mv -iv'         # Preferred 'mv' implementation
alias mkdir='mkdir -pv'   # Preferred 'mkdir' implementation
alias ll='ls -FGlAhp'     # Preferred 'ls' implementation
alias less='less -FSRXc'  # Preferred 'less' implementation

# Open program faster
alias r='ranger'
alias d='date && cal'
alias z='clear'
alias sc='screen'
alias em='emacsclient'
alias emt='emacsclient -t'
alias nf='neofetch'
alias tr='trans :ar'
alias pping='prettyping'

# mpv short cut
alias mpvs='mpv --sub-file'
alias mpvm='mpv --ytdl-format=18'
alias mpvms='mpv --ytdl-format=18 --sub-file'

# Git alias and color
alias g='grc git'
alias ga='git add'
alias gb='git branch'
alias gcm!!!='git add .; and git commit -m "Update"; and git push'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gcod='git checkout development'
alias gi='gitignore'
alias gm='git merge'
alias gpl='git pull'
alias gps='git push'
alias gpsu='git push -u origin master'
alias gs='git status'
alias gc='grc git clone'
alias gd='git diff'

### Colorize program
## with grc
alias ping='grc ping'
alias traceroute='grc traceroute'
alias gcc='grc gcc'
alias make='grc make'
alias netstat='grc netstat'
alias diff='grc diff'
alias last='grc last'
alias ldap='grc ldap'
alias cvs='grc cvs'

## with colout
alias colorshow='for c in {0..255}; do echo "$c color" | colout "color" $c; done'
alias aptup='sudo apt update | colout "Get" 118 | colout "Ign" 124 | colout "Hit" 226 | colout "^.*see.*$" 51'
alias aptin='sudo apt install'
