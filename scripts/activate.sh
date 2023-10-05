set -x
VERS=`cat ../VERSION`
rm "/home/arcjob/bin/tilos-archiver/active"
ln -s -f "/home/arcjob/bin/tilos-archiver/$VERS" "/home/arcjob/bin/tilos-archiver/active"
ls -la "/home/arcjob/bin/tilos-archiver"
set +x
