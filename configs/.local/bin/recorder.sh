#!/usr/bin/env sh

if pgrep wf-recorder; then
    killall -s SIGINT wf-recorder
    notify-send -t 3000 wf-recorder "record screen end"
else
    result=$(slurp)
    file=/tmp/recording_$(date +%Y-%m-%d_%H:%M:%S).mp4
    notify-send -t 5000 wf-recorder "begin record screen with geometry: $result, and will save to $file"
    wf-recorder -g "$result" -f $file
fi
