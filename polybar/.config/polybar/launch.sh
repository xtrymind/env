#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch bar
HOST=$(cat /etc/hostname)
if [[ ${HOST} = "archBox" ]]; then
	SECOND_MONITOR=$(xrandr | grep DVI-I-1)
	if [[ -n ${SECOND_MONITOR} ]]; then
		polybar -r i3_second &
	fi
	polybar -r i3 &
else
	polybar -r i3-a46c &
fi

echo "Bars launched..."
