#!/bin/sh
echo "$0"
echo "UTC `date -u +"%Y%m%d-%H%M%S"`"
echo "BP  `date +"%Y%m%d-%H%M%S"`"
cat $(dirname $0)/../VERSION
df -h | grep disk_sg20t
crontab -l | grep tilos
ls -la ~/capture

echo "process              count"
echo " arcjob              `ps -ef | grep -v grep | grep arcjob -c`"
echo " tilos_arc_cron_job  `ps -ef | grep -v grep | grep tilos_arc_cron -c`"
echo " tilos_arc_mp3_maker `ps -ef | grep -v grep | grep tilos_arc_mp3 -c`"
echo " fmedia              `ps -ef | grep -v grep | grep fmedia -c`"

if [ "$1" = "-v" ]; then
    echo
    echo "arcjob"
    ps -ef | grep -v grep | grep -v "ps -ef" | grep arcjob
    echo
    echo "tilos_arc_cron_job"
    ps -ef | grep -v grep | grep tilos_arc_cron_job
    echo
    echo "tilos_arc_mp3_maker"
    ps -ef | grep -v grep | grep tilos_arc_mp3_maker
    echo
    echo "fmedia"
    ps -ef | grep -v grep | grep fmedia
fi
