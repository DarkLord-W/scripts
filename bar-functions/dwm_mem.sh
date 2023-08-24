#!/bin/sh
#EDITED BY DARKLORD
#ArchLinux YES

icon_c="^c#43e812^^b#6873790x88^"
text_c="^c#7bdb46^^b#6873790x99^"
mem_icon=""

mem_usage() {
    mem_total=$(cat /proc/meminfo | grep "MemTotal:"| awk '{print $2}')
    mem_free=$(cat /proc/meminfo | grep "MemFree:"| awk '{print $2}')
    mem_buffers=$(cat /proc/meminfo | grep "Buffers:"| awk '{print $2}')
    mem_cached=$(cat /proc/meminfo | grep -w "Cached:"| awk '{print $2}')
    men_usage_rate=$(((mem_total - mem_free - mem_buffers - mem_cached) * 100 / mem_total))
    mem_text=$(echo $men_usage_rate | awk '{printf "%02d%", $1}')
    usage="$mem_text "

}

mem_info () {
    MEM=$(free -h | awk '/^内存/ {print $3 "/" $2}')
    mem_usage
    echo "$icon_c" "$mem_icon""$text_c" "$MEM"":""$usage"""

}



