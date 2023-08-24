#!/bin/sh

Icon_color="^c#c5bb34^^b#7E51680x88^"
Text_color="^c#e2df2b^^b#7E51680x99^"
date_icon=""

date_info () {
	#echo  " %s  %s" "$(date +%Y.%m.%d)" "$(date +%H:%M)" >> .resources
	echo "$Icon_color" "$date_icon""$Text_color" "$(date +%Y.%m.%d)" "$(date +%H:%M)"" "
	
}
