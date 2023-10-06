echo "$0"
set -x

BASEDIR=$(dirname $0)
VERS=`cat $BASEDIR/../VERSION`

mkdir -p "$HOME/bin"
mkdir -p "$HOME/capture"
mkdir -p "$HOME/logs"
chmod +w -R "$HOME/bin/tilos-archiver/$VERS"
rm -rf "$HOME/bin/tilos-archiver/$VERS"
mkdir -p "$HOME/bin/tilos-archiver/$VERS"
cp -f -r "$BASEDIR/../" "$HOME/bin/tilos-archiver/$VERS/"
chmod a-w -R "$HOME/bin/tilos-archiver/$VERS"

set +x

echo "==> Check crontab"
crontab -l | grep -v "#"
echo "==> crontab -e"
cat "$BASEDIR/../cron.txt"
