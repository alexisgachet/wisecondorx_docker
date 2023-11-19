#!/bin/bash

waitFileCompletion(){
    initial_mtime=$(stat -c %Y "$1")

    while true; do
        current_mtime=$(stat -c %Y "$1")

        if [ $(stat -c %s "$1") -eq 0 ]; then
            echo "$1 transfer in progress..."
            sleep 1
        fi
        if [ "$current_mtime" -eq "$initial_mtime" ]; then
            echo "File creation complete: $1"
            # Add your actions for a complete file
            break
        else
          echo "$1 transfer in progress..."
          # Sleep for a short duration before checking again
          sleep 1
        fi
    done
}

MONITORDIR=${MONITORDIR:-"/home/input"}

echo "Listening for new files in ${MONITORDIR}"

inotifywait -m -r -e create --format '%w%f' "${MONITORDIR}" | while read NEWFILE
do
    if [[ "$NEWFILE" != *.part ]]
    then
      waitFileCompletion "${NEWFILE}"
      echo "File ${NEWFILE} has been created"
    fi

done

