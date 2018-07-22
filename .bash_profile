#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

if [ -z "$DISPLAY" ] && [ "$(fgconsole)" -eq 1 ]; then
	startx
fi

#[ -z "$DISPLAY" -a "$(fgconsole)" -eq 1 ] && exec startx

if [[ -f /usr/bin/waterfox ]]; then
	export BROWSER="waterfox"
elif [[ -f /usr/bin/palemoon ]]; then
	export BROWSER="palemoon"
elif [[ -f /usr/bin/iceweasel ]]; then
	export BROWSER="iceweasel"
else
    export BROWSER="firefox"
#	export BROWSER="qutebrowser"
fi


PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"
if [ -e /home/master/.nix-profile/etc/profile.d/nix.sh ]; then . /home/master/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
_byobu_sourced=1 . /usr/bin/byobu-launch 2>/dev/null || true
