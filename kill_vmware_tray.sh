#! /bin/sh

kill_vmware_tray_with_pid()
{
	pids=`ps aux | grep vmware-tray | grep -v grep |awk '{print $2}'`
	if [ -n "$pids" ]
	then
		kill  $pids
	fi
}

kill_vmware_tray_with_pid
