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
bash ~/.config/Scripts/Dzen2.sh &

### when open dwm uncomment the follow
# while true
# do
# 	  VOL=$(amixer get Master | tail -1 | sed 's/.*\[\([0-9]*%\)\].*/\1/')
# 	  LOCALTIME=$(date +%Y-%m-%d\ %H:%M)
# 	  IP=$(for i in `ip r`; do echo $i; done | grep -A 1 src | tail -n1) # can get confused if you use vmware
# 	  # TEMP="$(($(cat /sys/class/thermal/thermal_zone0/temp) / 1000))C"

# 	  # if acpi -a | grep off-line > /dev/null
# 	  # then
# 		#     BAT="Bat. $(acpi -b | awk '{ print $4 " " $5 }' | tr -d ',')"
# 		#     xsetroot -name "$IP $BAT $VOL $TEMP $LOCALTIME"
# 	  # else
# 		#     xsetroot -name "$IP $VOL $TEMP $LOCALTIME"
# 	  # fi
# 		xsetroot -name "$IP $VOL $LOCALTIME"
# 	  sleep 20s
# done &

#exec i3
#exec dwm
exec frankenwm
