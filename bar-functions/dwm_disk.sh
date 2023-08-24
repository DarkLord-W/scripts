#!/bin/sh

ic_cOlor="^c#3dd8f9^^b#87964e0x88^"
te_cOlor="^c#1d48ec^^b#87964e0x99^"
disk_icon="🖪"

disk_info () {
    # Used and total storage in root part (rounded to 1024B)
    STOUSED=$(df -h | grep '/dev/nvme0n1p2' | awk '{print $3}')
    STOTOT=$(df -h | grep '/dev/nvme0n1p2' | awk '{print $2}')
    STOPER=$(df -h | grep '/dev/nvme0n1p2' | awk '{print $5}')

    
    #echo "🖪" "$STOUSED""/""$STOTOT"":""$STOPER" >> .resources
    echo "$ic_cOlor" "$disk_icon""$te_cOlor" "$STOUSED""/""$STOTOT"":""$STOPER"" "
    
}
}
