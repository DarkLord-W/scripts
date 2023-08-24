#!/bin/sh

function dwm_resources{

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
	
    # Used and total storage in /home (rounded to 1024B)
    STOUSED=$(df -h | grep '/dev/sdb2' | awk '{print $3}')
    STOTOT=$(df -h | grep '/dev/sdb2' | awk '{print $2}')
    STOPER=$(df -h | grep '/dev/sdb2' | awk '{print $5}')

	
	if [ $(echo "$CPU_USAGE < 10" | bc) -eq 1 ]; then
		CPU_USAGE="0"$CPU_USAGE
	fi
	
	#MEM_used=$(free -h | sed -n "2s/\([^ ]* *\)\{2\}\([^ ]*\).*/\2/p")
	MEM=$(free -h | awk '/^内存/ {print $3 "/" $2}')

    #echo "Mem "$MEM"  CPU "$CPU_USAGE"%  Disk "$STOUSED"/"$STOTOT
	echo " $MEM  $CPU_USAGE% 🖬 $STOUSED/$STOTOT"
}

dwm_resources
