#!/bin/bash

/usr/sbin/apachectl &

echo "#"
echo "#"
echo "# Open your browser and point it to"
echo "#   localhost[:port]/gbrowse2
echo "#"
echo "#"

exec "$@"

