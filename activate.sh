
VERS=`cat VERSION`

mv -f tilos_arc_mp3_maker.sh tilos_arc_mp3_maker.sh.bak
mv -f tilos_arc_mp3_maker.sh tilos_arc_mp3_maker.sh.bak

ln -s -f "/home/arcjob/bin/tilos-archiver/$VERS/scripts/tilos_arc_cron_job.sh" tilos_arc_cron_job.sh
ln -s -f "/home/arcjob/bin/tilos-archiver/$VERS/scripts/tilos_arc_mp3_maker.sh" tilos_arc_mp3_maker.sh
