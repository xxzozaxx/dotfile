#!/bin/bash
## __  ___       _ _
## \ \/ (_)_ __ (_) |_
##  \  /| | '_ \| | __|
##  /  \| | | | | | |_  :Ahmed's xinitrc:
## /_/\_\_|_| |_|_|\__| :ahmed_khaledATzohoDoTCoM:
##  ┏┓╻ ╻ ╻
##  ┃┗┫ ╺╋╸
##  ╹ ╹ ╹╹╹ :NIXERS:

# launch programs
setxkbmap -layout us,ar -variant prog-intl, -option grp:alt_shift_toggle &
xbindkeys &
xmodmap -e "keycode 72=" &
hsetroot -cover /home/master/.config/wall.png &
#hsetroot -tile /home/master/.config/wall.png &
#cat ~/Documents/PIM/Agenda.org Documents/PIM/Tasks.org | ag "^\*\ TODO" > ~/.Doing.txt
#cat ~/Documents/PIM/Agenda.org Documents/PIM/Tasks.org | ag "^\*\ DOING" >> ~/.Doing.txt
#cat ~/.Doing.txt | xrootconsole -fg "black" -geometry "200x70+10+20" ~/.Doing.txt &
#ls ~/.Doing.txt | entr -r xrootconsole  -geometry "200x70+10+20" ~/.Doing.txt &
compton --xrender-sync-fence &
redshift &

###while true # DWM status bar
###do
###    VOL=$(amixer get Master | tail -1 | sed 's/.*\[\([0-9]*%\)\].*/\1/')
###    LOCALTIME=$(date +%a\ %d\ %m\(%b\)\ \|\ %H:%M)
###    IP=$(for i in `ip r`; do echo $i; done | grep -A 1 src | tail -n1) # can get confused if you use vmware
###    # Battery monitoring
###    if [ -d /sys/class/power_supply/BAT0 ]; then
###        BATSTA=$(cat /sys/class/power_supply/BAT0/status)
###        BATCAP=$(cat /sys/class/power_supply/BAT0/capacity)
###    else
###        BATSTA=$(echo NO)
###        BATCAP=$(echo BAT)
###    fi
###    xsetroot -name "[IP]: $IP | [BAT]: $BATSTA $BATCAP | [VOL]: $VOL | $LOCALTIME"
###    sleep 1s
###done &
slstatus &
exec dwm
#exec 2bwm
#exec ~/.cabal/bin/xmonad
#exec /home/master/Programs/plan9port/bin/rio
