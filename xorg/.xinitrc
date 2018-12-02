#!/bin/sh

resources=$HOME/.Xresources
modmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps
[[ -f $sysresources ]] && xrdb -merge $sysresources
[[ -f $sysmodmap ]] && xmodmap $sysmodmap

# Merge .Xresources and .Xmodmap
[[ -f $resources ]] && xrdb -merge $resources
[[ -f $modmap ]] && xmodmap $modmap

# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

dbus-update-activation-environment --systemd DISPLAY
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

numlockx &                                    	# enable numlock
$HOME/.fehbg &                                	# set up wallpaper
udiskie &					# udiskie daemon
nm-applet &                                   	# enable network manager applet
pgrep redshift-gtk &> /dev/null || redshift-gtk &> /dev/null &
xbindkeys &
/home/xtrymind/.config/tumbler_fix.sh &
exec i3                                       	# start i3
