#!/bin/sh

MONITORDIR="/home/input"

echo "Listening for new files in ${MONITORDIR}"

inotifywait -m -r -e create --format '%w%f' "${MONITORDIR}" | while read NEWFILE
do
    echo "File ${NEWFILE} has been created"
done