#!/usr/bin/env bash

# Check if warp-cli is installed
if ! command -v /usr/local/bin/warp-cli &> /dev/null; then
    echo "No warp-cli installed"
    exit 0
fi

# Get WARP status
STATUS=$(/usr/local/bin/warp-cli status 2>/dev/null)

# Use grep to check status
if echo "$STATUS" | grep -q "Disconnected"; then
    /usr/local/bin/warp-cli connect
elif echo "$STATUS" | grep -q "Connected"; then
    /usr/local/bin/warp-cli disconnect
fi
