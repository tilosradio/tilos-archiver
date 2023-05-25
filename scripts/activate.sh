set -x
BASEDIR=$(dirname $0)
VERS=`cat "$BASEDIR/../VERSION"`
rm "$HOME/bin/tilos-archiver/active"
ln -s -f "$HOME/bin/tilos-archiver/$VERS" "$HOME/bin/tilos-archiver/active"
ls -la "$HOME/bin/tilos-archiver"
set +x
