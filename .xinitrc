#!/bin/bash
## __  ___       _ _
## \ \/ (_)_ __ (_) |_
##  \  /| | '_ \| | __|
##  /  \| | | | | | |_  :Ahmed's xinitrc:
## /_/\_\_|_| |_|_|\__| :ahmed_khaledATzohoDoTCoM:
##  ┏┓╻ ╻ ╻
##  ┃┗┫ ╺╋╸
##  ╹ ╹ ╹╹╹ :NIXERS:

setxkbmap -layout us,ar -variant prog-intl, -option grp:alt_shift_toggle	&
xbindkeys									&
xmodmap -e "keycode 72="							&
#hsetroot -cover /home/master/.config/wall.png					&
#hsetroot -tile /home/master/.config/wall.png					&
compton --xrender-sync-fence							&
redshift									&
slstatus									&

exec dwm
#exec wm
#exec glazier
#exec 2bwm
#exec ~/.cabal/bin/xmonad
#exec /home/master/Programs/plan9port/bin/rio -term st -virtuals 2
#exec fvwm
#exec cwm
