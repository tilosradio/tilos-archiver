echo "$0 - $$ - $HOME"
LOG="$HOME/logs/job_`date -u +"%Y%m%d_%H%M%S"_utc_$$.log`"
echo "`date -u +"%Y%m%d_%H%M%S"` $$ begin   $LOG" >> "$HOME/logs/jobs.log"
$HOME/bin/tilos-archiver/active/scripts/tilos_arc_mp3_maker.sh $1 $2 > "$LOG" 2>&1
echo "`date -u +"%Y%m%d_%H%M%S"` $$ finised $LOG" >> $HOME/logs/jobs.log
