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
setxkbmap -layout de,ar -variant qwertz_neo, -option grp:alt_shift_toggle &
# feh --bg-fill /home/master/.config/wall.png &
hsetroot -cover /home/master/.config/wall.png &
compton --xrender-sync-fence &
redshift &
xbindkeys &
#bash ~/.config/Scripts/Dzen2.sh &

#when open dwm uncomment the follow
while true
do
	  VOL=$(amixer get Master | tail -1 | sed 's/.*\[\([0-9]*%\)\].*/\1/')
	  LOCALTIME=$(date +%a\ %d\ %m\ \|\ %H:%M)
	  IP=$(for i in `ip r`; do echo $i; done | grep -A 1 src | tail -n1) # can get confused if you use vmware
		xsetroot -name "[IP]: $IP | [VOL]: $VOL | $LOCALTIME"
	  sleep 20s
done &

#exec i3
#exec frankenwm
exec dwm
