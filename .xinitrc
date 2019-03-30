#!/bin/bash
##__  ___       _ _
##\ \/ (_)_ __ (_) |_
## \  /| | '_ \| | __|
## /  \| | | | | | |_  :Ahmed's xinitrc:
##/_/\_\_|_| |_|_|\__| :ahmed_khaledATzohoDoTCoM:
## ┏┓╻╻ ╻
## ┃┗┫╺╋╸
## ╹ ╹╹ ╹

# launch programs
setxkbmap -layout us,ar -variant prog-intl, -option grp:alt_shift_toggle &
# feh --bg-fill /home/master/.config/wall.png &
hsetroot -cover /home/master/.config/wall.png &
#hsetroot -tile /home/master/.config/wall.png &
cat ~/.Doing.txt | xrootconsole  -geometry "200x70+10+20" &
compton --xrender-sync-fence &
redshift &
xbindkeys &
abduco -n dropdown tabbed -r st -w '' -e mksh &
#emacs --daemon &

#when open dwm uncomment the follow
while true
do
    VOL=$(amixer get Master | tail -1 | sed 's/.*\[\([0-9]*%\)\].*/\1/')
    LOCALTIME=$(date +%a\ %d\ %m\(%b\)\ \|\ %H:%M)
    IP=$(for i in `ip r`; do echo $i; done | grep -A 1 src | tail -n1) # can get confused if you use vmware
    # Battery monitoring
    if [ -d /sys/class/power_supply/BAT0 ]; then
        BATSTA=$(cat /sys/class/power_supply/BAT0/status)
        BATCAP=$(cat /sys/class/power_supply/BAT0/capacity)
    else
        BATSTA=$(echo NO)
        BATCAP=$(echo BAT)
    fi
    xsetroot -name "[IP]: $IP | [BAT]: $BATSTA $BATCAP | [VOL]: $VOL | $LOCALTIME"
    sleep 10s
done &

exec dwm
#exec ~/Programs/1WindowManager/dwm/dwm
#exec ~/Programs/1WindowManager/DynamicWindowManager/dwm
