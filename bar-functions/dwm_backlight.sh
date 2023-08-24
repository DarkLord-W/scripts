#!/bin/sh
#EDITED BY DARKLORD
#ArchLinux YES

icoN_color="^c#a923e1^^b#6E51760x88^"
texT_color="^c#e458ef^^b#6E51760x99^"
backlight_icon="☀"

backlight_info () {
	if [ -d "/sys/class/backlight/amdgpu_bl1/" ];then
    	max=`cat /sys/class/backlight/amdgpu_bl1/max_brightness`
    	current=`cat /sys/class/backlight/amdgpu_bl1/actual_brightness`
    	rate_origin=`echo "scale=1;$current/$max"|bc`
    	rate_final_1=`echo "$rate_origin* 10"|bc`
		rate_final_2=`echo $rate_final_1|cut -f1 -d"."`
	else
  		max=`cat /sys/class/backlight/nvidia_0/max_brightness`
    	current=`cat /sys/class/backlight/nvidia_0/actual_brightness`
    	rate_origin=`echo "scale=1;$current/$max"|bc`
    	rate_final_1=`echo "$rate_origin* 10"|bc`
		rate_final_2=`echo $rate_final_1|cut -f1 -d"."`
	fi

	#echo "☀" $rate_final_2 >> .resources
	echo "$icoN_color" "$backlight_icon""$texT_color" "$rate_final_2"" "
}
