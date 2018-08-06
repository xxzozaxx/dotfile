#!/usr/bin/env bash

Vol() {
	  # mute=$(amixer get PCM | grep Mono: | cut -d " " -f 8)
	  # echo -n $mute
	  #then
    #		echo -n "^fg(orange)^i("/home/wilhem/dzen-icons/spkr_02.xbm") : Muet  ^fg()| "
    #fi
    status=$(amixer get Master | grep "Right:" | cut -d " " -f 8 | cut -c2-3)
    prec=$(amixer get Master | grep "Right:" | cut -d " " -f 7 | cut -c2-4)
    case status
    in
        "on") echo -n "^fg(blue) \[VOL: $prec]";;
        "of") echo -n "^fg(red) \[VOL: Muet]";;
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
	  # Disk
	  Wifi
	  # Battery
	  # Music
	  # Rss
	  Time
	  echo
	  return
}

while true
do
	  sleep 1
	  echo "$(Print)"
done | dzen2 -p -fn 'gohufont-11' -h '15' -ta r -dock
