#!/bin/sh

iconcolor="^c#1d98e8^^b#6E51760^"
textcolor="^c#3ad1e8^^b#6E51760^"
cpu_icon="🖵"



cpu_calculate () {


	LAST_CPU_INFO=$(cat /proc/stat | grep -w cpu | awk '{print $2,$3,$4,$5,$6,$7,$8}')
	LAST_SYS_IDLE=$(echo $LAST_CPU_INFO | awk '{print $4}')
	LAST_TOTAL_CPU_T=$(echo $LAST_CPU_INFO | awk '{print $1+$2+$3+$4+$5+$6+$7}')

	sleep 1

	NEXT_CPU_INFO=$(cat /proc/stat | grep -w cpu | awk '{print $2,$3,$4,$5,$6,$7,$8}')
	NEXT_SYS_IDLE=$(echo $NEXT_CPU_INFO | awk '{print $4}')
	NEXT_TOTAL_CPU_T=$(echo $NEXT_CPU_INFO | awk '{print $1+$2+$3+$4+$5+$6+$7}')

	SYSTEM_IDLE=$(echo ${NEXT_SYS_IDLE} ${LAST_SYS_IDLE} | awk '{print $1-$2}')
	TOTAL_TIME=$(echo ${NEXT_TOTAL_CPU_T} ${LAST_TOTAL_CPU_T} | awk '{print $1-$2}')
	CPU_USAGE=$(echo ${SYSTEM_IDLE} ${TOTAL_TIME} | awk '{printf "%.2f", 100-$1/$2*100}')
	
	if [ $(echo "$CPU_USAGE < 10" | bc) -eq 1 ]; then
		CPU_USAGE="0"$CPU_USAGE
	fi
	
	echo "$iconcolor" "$cpu_icon""$textcolor" "$CPU_USAGE""% "

}
