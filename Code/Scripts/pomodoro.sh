#!/bin/bash
#------------------------------------------------
#
# A simple Pomodoro method timer in bash
# Uses espeak to announce Work/Break/Long-Break
#
# ./pomodoro.sh
#
# Hope you ejoy,
#    Phillip J Rhoades
#
#------------------------------------------------

#Times
workminutes=25 #working pomodoro minutes
shortbreak=5 #short break minutes
longbreak=15 #long break minutes
pommax=4 #Work pomodoros before long break

#Initializing
pomcount=0
thebreak=0
sbreaker=0

#Sounds
sbsound="/usr/share/sounds/purple/receive.wav"
lbsound="/usr/share/sounds/speech-dispatcher/test.wav"
wksound="/usr/share/xdx/sounds/attention.wav"

###

tput civis #hide the cursor

#Bring the cursor back after ctrl-c
trap ctrl_c INT
function ctrl_c() {
    tput cvvis
	  exit
}

#Loop those pomodoros
while [ 1 ]; do
	  if [ $sbreaker -eq 1 ] && [ $pomcount -ne $pommax  ]; then
        let "sbreaker=0"
		    dominutes=$shortbreak
		    theword="SHORT BREAK:"
		    thesound="$sbsound"
	  else
		    if [ $pomcount -eq $pommax ]; then
			      let "pomcount=0"
			      dominutes=$longbreak
			      theword="LONG BREAK:"
			      thesound="$lbsound"
			      let "sbreaker=0"
		    else
			      let "pomcount+=1"
			      dominutes=$workminutes
			      theword="WORK $pomcount:"
			      thesound="$wksound"
			      let "sbreaker=1"
		    fi
	  fi

	  #echo "$pomcount | $thebreak | $dominutes"

	  secs=$(($dominutes * 60))
	  echo $theword |espeak >/dev/null
	  while [ $secs -gt 0 ]; do
		    #echo -ne "$theword $secs\033[0K\r"
		    theminutes=$(printf "%02d" $((m=(${secs}%3600)/60)))
		    theseconds=$(printf "%02d" $((s=${secs}%60)))
		    echo -ne "$theword $theminutes:$theseconds\033[0K\r"
		    sleep 1
		    : $((secs--))
	  done
	  #play "$thesound" >/dev/null
done
