#!/bin/sh

case "$1" in
    up)
        amixer -D pulse set Master 5%+ unmute >/dev/null
        ;;
    down)
        amixer -D pulse set Master 5%- unmute >/dev/null
        ;;
    mute)
        amixer -D pulse set Master toggle >/dev/null
        ;;
esac

# get volume + state
vol=$(amixer -D pulse get Master | grep -o '[0-9]\+%' | head -n1)
state=$(amixer -D pulse get Master | grep -o '\[on\]\|\[off\]' | head -n1 | tr -d '[]')

notify-send \
  -h string:x-canonical-private-synchronous:volume \
  "Volume" "$vol ($state)"# Get volume + state
vol=$(amixer -D pulse get Master | grep -o '[0-9]\+%' | head -n1)
state=$(amixer -D pulse get Master | grep -o '\[on\]\|\[off\]' | head -n1 | tr -d '[]')

# show if muted
if [ "$state" = "off" ]; then
    text="$vol (muted)"
else
    text="$vol"
fi

notify-send \
  -h string:x-canonical-private-synchronous:volume \
  "Volume" "$text"
