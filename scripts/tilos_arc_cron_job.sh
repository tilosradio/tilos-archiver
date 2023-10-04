echo "$0"
PID="$$"
LOG="/home/arcjob/logs/cron_$PID_`date -u +"%Y%m%d_%H%M%S"_utc.log`"
echo "`date -u +"%Y%m%d_%H%M%S"` $USER begin:   $LOG" >> /home/arcjob/logs/jobs.log
/home/arcjob/bin/tilos-archiver/active/scripts/tilos_arc_mp3_maker.sh $1 $2 > "$LOG" 2>&1
echo "`date -u +"%Y%m%d_%H%M%S"` $USER finised: $LOG" >> /home/arcjob/logs/jobs.log
