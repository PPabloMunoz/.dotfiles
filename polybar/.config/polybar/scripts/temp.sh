#!/bin/bash
temp_raw=$(cat /sys/class/thermal/thermal_zone0/temp)
temp=$((temp_raw / 1000))
echo "${temp}°C"

