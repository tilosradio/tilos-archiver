echo "install.sh"
echo "version 1.0.0"
set -x

mkdir -p ~/bin
mkdir -p ~/capture
mkdir -p ~/logs

cp -f ./scripts/tilos_arc_cron_job.sh /home/arcjob/bin
cp -f ./scripts/tilos_arc_mp3_maker.sh /home/arcjob/bin
chmod uga+x /home/arcjob/bin/tilos_arc_cron_job.sh
chmod uga+x /home/arcjob/bin/tilos_arc_mp3_maker.sh
chmod uga-w /home/arcjob/bin/tilos_arc_cron_job.sh
chmod uga-w /home/arcjob/bin/tilos_arc_mp3_maker.sh
set +x

crontab -l

echo "crontab -e"
more cron.txt
