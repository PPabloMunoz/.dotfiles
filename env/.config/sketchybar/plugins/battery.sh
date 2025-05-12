#!/usr/bin/env bash

# Get battery info
BATTERY_INFO=$(pmset -g batt)

# Exit quietly if no battery is found
if ! echo "$BATTERY_INFO" | grep -qi "InternalBattery"; then
  sketchybar --set "$NAME" icon= label= label.color=0x00000000 width=0
  exit 0
fi

# Extract percentage
PERCENTAGE=$(echo "$BATTERY_INFO" | grep -o '[0-9]\{1,3\}%' | tr -d '%')

# Extract charging status (first word after 'Now drawing from')
STATUS=$(echo "$BATTERY_INFO" | grep -o "Now drawing from.*" | awk '{print $4}' | tr -d '"')

# Default icon and color
ICON=""
COLOR="0xffffffff"

# Apply logic based on charging status and percentage
if echo "$BATTERY_INFO" | grep -q "discharging"; then
  if [ "$PERCENTAGE" -le 20 ]; then
    COLOR="0xfff38ba8"
  else
    COLOR="0xfffab387"
  fi
  ICON=""
else
  COLOR="0xffa6e3a1"
  ICON=""
fi

# Output for SketchyBar
sketchybar --set "$NAME" icon="$ICON" icon.color="$COLOR" icon.background="0xffff0000" label="$PERCENTAGE%"
