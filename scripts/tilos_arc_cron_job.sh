echo "tilos_arc_cron_job.sh"
echo "version 1.0.0"
LOG="/home/arcjob/logs/cron_`date -u +"%Y%m%d_%H%M%S"_utc.log`"
/home/arcjob/bin/tilos_arc_mp3_maker.sh $1 $2 > "$LOG" 2>&1
