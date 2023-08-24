#!/bin/bash
#EDITED BY DARKLORD
#ArchLinux YES

icoN_colOr="^c#5cf13a^^b#5555660x66^"
texN_colOr="^c#2eef45^^b#5555660x77^"

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

LOC=$(readlink -f "$0")
DIR=$(dirname "$LOC")

. "$DIR/bar-functions/dwm_cpu.sh"
. "$DIR/bar-functions/dwm_mem.sh"
. "$DIR/bar-functions/dwm_disk.sh"
. "$DIR/bar-functions/dwm_battery.sh"
. "$DIR/bar-functions/dwm_alsa.sh"
. "$DIR/bar-functions/dwm_date.sh"
#. "$DIR/bar-functions/dwm_netspeed.sh"
. "$DIR/bar-functions/dwm_backlight.sh"
. "$DIR/bar-functions/syyu-log.sh"



while true; do
	#To calculate upload && download speed
	get_bytes
	download_speed=$(get_speed $download)
	upload_speed=$(get_speed $upload)
	upload_info=$(echo $icoN_colOr "↑"$texN_colOr$upload_speed)
	download_info=$(echo $icoN_colOr"↓"$texN_colOr$download_speed" ")
	#Set xsetroot to dwm bar
	xsetroot -name "$(cpu_calculate)$(mem_info)$(disk_info)$upload_info $download_info$(backlight_info)$(battery_info)$(alsa_info)$(date_info)$(syyu_info)"
	sleep 1
done &
