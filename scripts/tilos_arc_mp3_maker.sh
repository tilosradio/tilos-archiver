#!/bin/sh
# set -x
echo "tilos_arc_mp3_maker.sh"
echo "version 1.0.0"
date -u
date -u -d "1 min"

YEAR=`date -u -d "1 min" +"%Y"`
MOUNT=`date -u -d "1 min" +"%m"`
DAY=`date -u -d "1 min" +"%d"`
HOUR=`date -u -d "1 min" +"%H"`
MINUTE=`date -u -d "1 min" +"%M"`
FILENAME="tilosradio-$YEAR$MOUNT$DAY-$HOUR$MINUTE.mp3"
ONLINEPATH="/online/$YEAR/$MOUNT/$DAY"
REMOTEPATH="tilos@archive.tilos.hu:/online/$YEAR/$MOUNT/$DAY"
STREAM="http://stream.tilos.hu/tilos_128.mp3"
DURATION=1822
CAPTUREPATH="/home/arcjob/capture"
FMEDIA="/home/arcjob/bin/fmedia"

if [ "$1" = "-d" ]; then 
    DURATION=$2
fi

SLEEPTIME=`expr 58 - \`date +%S\``
echo "waiting for the 58sec... sleep $SLEEPTIME"
sleep $SLEEPTIME

echo "make dir for the day $ONLINEPATH"
mkdir -p "$ONLINEPATH"

echo "Capture into $FILENAME"
"$FMEDIA" "$STREAM" -o "$CAPTUREPATH/$FILENAME" --stream-copy --until=$DURATION
echo "Move into $ONLINEPATH"
mv "$CAPTUREPATH/$FILENAME" "$ONLINEPATH/$FILENAME"
# remote copy to archiver storage
# sftp
echo sftp "$ONLINEPATH/$FILENAME" "$REMOTEPATH/$FILENAME"
date -u
echo "Done"
