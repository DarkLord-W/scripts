#!/bin/sh

icon_coloR="^c#ef4f67^^b#4865660x88^"
text_coloR="^c#d75eb6^^b#4865660x99^"

battery_info () {
    CHARGE=$(cat /sys/class/power_supply/BAT0/capacity)
    STATUS=$(cat /sys/class/power_supply/BAT0/status)

	if [ "$STATUS" = "Charging" ]; then
		#printf "🔌 %s%%" "$CHARGE"
		echo "$icon_coloR" "🔌""$text_coloR" "$CHARGE"" "
	else
	   #printf "🔋 %s%%" "$CHARGE" 
	   echo "$icon_coloR" "🔋""$text_coloR" "$CHARGE"" "
	fi
} 
