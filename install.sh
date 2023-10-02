echo "install.sh"
set -x

VERS=`cat VERSION`

mkdir -p /home/arcjob/bin
mkdir -p /home/arcjob/capture
mkdir -p /home/arcjob/logs
mkdir -p "/home/arcjob/bin/$VERS"

cp -f * "/home/arcjob/bin/$VERS"
chmod a-w -R "/home/arcjob/bin/$VERS/*"
chmod uga+x -R "/home/arcjob/bin/$VERS/*.sh"

ln -s -f "/home/arcjob/bin/$VERS/scripts/tilos_arc_cron_job.sh" tilos_arc_cron_job.sh
ln -s -f "/home/arcjob/bin/$VERS/scripts/tilos_arc_mp3_maker.sh" tilos_arc_mp3_maker.sh

set +x

crontab -l

echo "crontab -e"
more cron.txt
