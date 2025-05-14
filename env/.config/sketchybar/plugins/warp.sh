#!/usr/bin/env bash

# Check if warp-cli is installed
if ! command -v /usr/local/bin/warp-cli &> /dev/null; then
    sketchybar --set "$NAME" label="WARP not installed"
    exit 0
fi

# Get WARP status
STATUS=$(/usr/local/bin/warp-cli status 2>/dev/null)

# Use grep to check status
if echo "$STATUS" | grep -q "Disconnected"; then
    sketchybar --set "$NAME" background.color=0xfff38ba8 icon=""
elif echo "$STATUS" | grep -q "Connected"; then
    sketchybar --set "$NAME" background.color=0xfffab387 icon="󱇱"
elif echo "$STATUS" | grep -q "Connecting"; then
    sketchybar --set "$NAME" background.color=0xff89b4fa icon="󰘿"
else
    sketchybar --set "$NAME" background.color=0xff89b4fa icon=""
fi
