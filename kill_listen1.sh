#! /bin/zsh

kill_listen1_with_pid()
{
	pids=`ps aux | grep listen1 | grep -v grep |awk '{print $2}'`
	if [ -n "$pids" ]; then
		kill  $pids
	fi
}

kill_listen1_with_pid
