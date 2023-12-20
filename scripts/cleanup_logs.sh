echo "$0 - $$ - $HOME"
find $HOME/logs -name "job_*.log" -mtime +60 -delete
