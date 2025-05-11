#!/bin/bash

# Get the primary network interface (e.g., en0)
INTERFACE=$(route get default 2>/dev/null | awk '/interface: / { print $2 }')

# Get initial RX/TX bytes
RX1=$(netstat -ib | awk -v iface="$INTERFACE" '$1 == iface && $7 ~ /^[0-9]+$/ { rx += $7 } END { print rx }')
TX1=$(netstat -ib | awk -v iface="$INTERFACE" '$1 == iface && $10 ~ /^[0-9]+$/ { tx += $10 } END { print tx }')

sleep 1

# Get RX/TX bytes after 1 second
RX2=$(netstat -ib | awk -v iface="$INTERFACE" '$1 == iface && $7 ~ /^[0-9]+$/ { rx += $7 } END { print rx }')
TX2=$(netstat -ib | awk -v iface="$INTERFACE" '$1 == iface && $10 ~ /^[0-9]+$/ { tx += $10 } END { print tx }')

# Calculate bytes per second
RX_BPS=$(( RX2 - RX1 ))
TX_BPS=$(( TX2 - TX1 ))

# Convert to KB/s
RX_KB=$(( RX_BPS / 1024 ))
TX_KB=$(( TX_BPS / 1024 ))

# Function to format speed as KB/s or MB/s
format_speed() {
  local KB=$1
  if [ "$KB" -ge 1000 ]; then
    MB=$(echo "scale=2; $KB / 1024" | bc)
    echo "${MB} MB/s"
  else
    echo "${KB} KB/s"
  fi
}

# Format and display speeds
DL=$(format_speed "$RX_KB")
UL=$(format_speed "$TX_KB")

# Set default colors
COLOR_DOWN="0xffffffff"
COLOR_UP="0xffffffff"

# Update colors if traffic is present
if [ "$RX_KB" -gt 0 ]; then
  COLOR_DOWN="0xff89b4fa"
fi

if [ "$TX_KB" -gt 0 ]; then
  COLOR_UP="0xfff38ba8"
fi


sketchybar --set "net_up" label="$UL" label.color="$COLOR_UP"
sketchybar --set "net_down" label="$DL" label.color="$COLOR_DOWN"
