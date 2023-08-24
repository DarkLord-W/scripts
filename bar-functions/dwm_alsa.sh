#!/bin/sh


icon_Color="^c#2536f3^^b#7879560x88^"
text_Color="^c#2575f3^^b#7879560x99^"

alsa_info () {
	STATUS=$(amixer sget Master | tail -n1 | sed -r "s/.*\[(.*)\]/\1/")
    VOL=$(amixer get Master | tail -n1 | sed -r "s/.*\[(.*)%\].*/\1/")
	if [ "$STATUS" = "off" ]; then
			#printf "🔇 --%%"
			echo "$icon_Color" "🔇 --%%""$text_Color" "--%% "
	else
		if [ "$VOL" -le 9 ]; then
			#printf "🔈 0%s%%" "$VOL"
			echo "$icon_Color" "🔈""$text_Color" "$VOL""% "
		elif [ "$VOL" -gt 9 ] && [ "$VOL" -le 33 ]; then
			#printf "🔈 %s%%" "$VOL"
			echo "$icon_Color" "🔈""$text_Color" "$VOL""% "
		elif [ "$VOL" -gt 33 ] && [ "$VOL" -le 66 ]; then
			#printf "🔉 %s%%" "$VOL"
			echo "$icon_Color" "🔈""$text_Color" "$VOL""% "
		else
			#printf "🔊 %s%%" "$VOL"
			echo "$icon_Color" "🔈""$text_Color" "$VOL""% "
		fi
	fi
}
