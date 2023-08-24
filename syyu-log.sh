#! /bin/bash

function read_history {
	cat /YourPath/.bash_history |while read line
	do
		res=$(echo $line |grep "sudo pacman -Syyu")
		if [ "$res" != "" ]
		then
			raw_time=`echo $line|grep -Eo ":.*:"|tr -cd "[0-9]"`
			#result=$(cat /Data/File/.syyu.log | grep "${raw_time}")
			#if [ "$result" = "" ]
			if cat '~/.syyu.log' | grep "${raw_time}" > /dev/null
			then
				continue
			else
				echo $raw_time >> ~/.syyu.log
			fi
		fi
	done
}

#function calculate_date {
#	last=`tail -n 1 /Data/File/.syyu.log`
#	last1=`date -d @$last +"%Y-%m-%d"`
#	today=`date +%s`
#	today1=`date -d @$today +"%Y-%m-%d"`
#	if [ "$last" != "" ]
#	then
#		time_final=`python3 calculate_date.py $today1 $last1`
#	else
#		time_final=NULL
#	fi
#}

function calculate_date {
	last=`tail -n 1 ~/.syyu.log`
	last1=`date -d @$last +"%Y-%m-%d"`
	today=`date +%s`
	today1=`date -d @$today +"%Y-%m-%d"`
	if [ "$last" != "" ]
	then
		today_f=`date +%s -d "$today1"`
		last_f=`date +%s -d "$last1"`
		sub=`expr $today_f - $last_f`
		time_final=$(($sub/86400))
	else
		time_final=NULL
	fi
}

function syyu {
	read_history
	calculate_date
}



