#!/bin/sh
# Acces your Transmission with username and password
SERVER="9091 --auth username:password"

# Get torrent list
TORRENTLIST=`transmission-remote $SERVER --list | sed -e '1d;$d;s/^ *//' | cut --only-delimited --delimiter=" " --fields=1`

transmission-remote $SERVER --list

for TORRENTID in $TORRENTLIST
do
    echo Processing : $TORRENTID
    DL_COMPLETED=`transmission-remote $SERVER --torrent $TORRENTID --info | grep "Percent Done: 100%"`

    # Check if each torrent is completed
    if [ "$DL_COMPLETED" != "" ]; then
        echo "Torrent #$TORRENTID is completed"
        echo "Removing torrent from list"
        transmission-remote $SERVER --torrent $TORRENTID --remove
    else
        echo "Torrent #$TORRENTID is not completed. Ignoring."
    fi
done