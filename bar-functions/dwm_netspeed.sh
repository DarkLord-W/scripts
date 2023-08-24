#!/bin/zsh
#this script show netspeed as kb/s and mb/s for archlinux , EDITED BY DARKLORD
#ArchLinux YES
#get raw bytes
icon_color="^c#2D1B46^^b#5555660x66^"
text_color="^c#2D1B46^^b#5555660x77^"

function get_bytes(){
	interface=$(ip route get 1.1.1.1 2>/dev/null| awk '{print $5}')
	received_bytes_old=$(grep $interface /proc/net/dev | cut -d ':' -f 2 | awk '{print $1}')
	transmitted_bytes_old=$(grep $interface /proc/net/dev | cut -d ':' -f 2 | awk '{print $9}')
	
	sleep 1
	clear
	
	received_bytes_new=$(grep $interface /proc/net/dev | cut -d ':' -f 2 | awk '{print $1}')
	transmitted_bytes_new=$(grep $interface /proc/net/dev | cut -d ':' -f 2 | awk '{print $9}')
	
	upload1=${transmitted_bytes_old}
	upload2=${transmitted_bytes_new}
	download1=${received_bytes_old}
	download2=${received_bytes_new}
	
	((upload=$upload2-$upload1))
	((download=$download2-$download1))	
}

#
function get_speed(){
	value=$1
	
	if test "$value" -gt 1048576 # aka 1024*1024 , for MB/S
	then
		data=$(echo "scale=4; $value/1024" |bc)
		echo $(echo "scale=2; $data/1024" |bc) MB/s
	else
		echo $(echo "$value/(1024)" |bc)KB/s
	fi
}

fun netspeed_calculate(){
	get_bytes
	download_speed=$(get_speed $download)
	upload_speed=$(get_speed $upload)
	#echo "↑" $upload_speed "↓" $download_speed >> .resources
	echo "$icon_color" "↑" "$text_color" "$upload_speed" "$icon_color" "↓" "$text_color" "$download_speed" 
}
