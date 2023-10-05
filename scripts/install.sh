echo "install.sh"
set -x

VERS=`cat ../VERSION`

mkdir -p /home/arcjob/bin
mkdir -p /home/arcjob/capture
mkdir -p /home/arcjob/logs
mkdir -p "/home/arcjob/bin/tilos-archiver/$VERS"

cp -f -r ../* "/home/arcjob/bin/tilos-archiver/$VERS"

# chmod a+x -R "/home/arcjob/bin/tilos-archiver/$VERS/*.sh"
chmod a+x -R "/home/arcjob/bin/tilos-archiver/$VERS/scripts/*.sh"
chmod a-w -R "/home/arcjob/bin/tilos-archiver/$VERS"

set +x

echo "==> Check crontab"
crontab -l | grep -v "#"
echo "==> crontab -e"
cat ../cron.txt
