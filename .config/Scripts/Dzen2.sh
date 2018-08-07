#!/usr/bin/env bash

Vol() {
    status=$(amixer get Master | grep "Right:" | cut -d " " -f 8 | cut -c2-3)
    prec=$(amixer get Master | grep "Right:" | cut -d " " -f 7 | cut -c2-4)
    case $(echo $status)
    in
        "on") echo -n "^fg(green)^i \[VOL: $prec] ^fg()| ";;
        "of") echo -n "^fg(blue)^i \[VOL: Muet] ^fg()| ";;
        "else") echo -n "ERR";;
    esac
	  return
}

Wifi() {
    ssid=$(nmcli -t -f active,ssid dev wifi | egrep '^yes' | cut -c5-)
    ip=$( ip add sho | grep 192 | cut -c9-20)
	  echo -n "^fg(purple)^i \[WIFI: $ssid  $ip] ^fg()| "
	  return
}

Battery() {
	  charge=$(acpi|cut -d "," -f 2)
	  echo -n "^fg(yellow)^i(/home/wilhem/dzen-icons/bat_full_02.xbm) : $charge^fg() | "
	  return
}

Disk() {
	  space=$(df -h /home|sed '1d'|awk '{print $4}')
	  echo -n "^fg(green)^i(/home/wilhem/dzen-icons/diskette.xbm) : $space ^fg()| "
	  return
}

Time() {
	  hour=$(date +"%H:%M:%S")
	  date=$(date +"%a %d %b")
	  echo -n "^fg(red)$date ^fg()| ^i(/home/wilhem/dzen-icons/clock.xbm) : $hour "
	  return
}

Music() {
	  play=$(ncmpcpp --now-playing)
	  if [[ $play ]]; then
		    echo -n "^fg(blue)^ca(1, ncmpcpp toggle)^i(/home/wilhem/dzen-icons/note.xbm) : $play^ca()^fg() | "
	  fi
	  return
}

Rss() {
	  if [ -f /home/wilhem/rien ]; then
		    rm /home/wilhem/rien
	  fi
}

Print () {
	  Vol
	  Wifi
	  Time
	  echo
	  return
}

while true
do
	  sleep 1
	  echo "$(Print)"
done | dzen2 -p -fn 'tamsyn' -h '15' -ta r -dock
