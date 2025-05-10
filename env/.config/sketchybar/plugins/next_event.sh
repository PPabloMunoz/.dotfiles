#!/usr/bin/env bash

# Fetch the next upcoming event
NEXT_EVENT=$(icalBuddy -n -li 1 -ps "| |" -iep 'title,datetime' eventsFrom:now to:today+1)

# Check if there’s an event; if not, show a fallback message
if [ -z "$NEXT_EVENT" ]; then
  sketchybar --set "$NAME" label="No events"
else
  FORMATTED_EVENT=$(echo "$NEXT_EVENT" | awk -F' \\| ' '{
    # Clean title: remove text in parentheses
    title = $1;
    gsub(/ \([^)]*\)/, "", title);
    # Extract start time (e.g., 13:00)
    split($2, dt, " at ");
    split(dt[2], times, " - ");
    print title " | " times[1]
  }')
  sketchybar --set "$NAME" label="$FORMATTED_EVENT"
fi

