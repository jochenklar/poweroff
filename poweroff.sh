#!/usr/bin/env bash

RUN_PATH=/var/run/poweroff
TIMEOUT_START=180
TIMEOUT_CHECK=30

if [ ! -d "$RUN_PATH" ]; then
    echo "Error: Directory '$RUN_PATH' does not exist."
    exit 1
fi

rm -rf "${RUN_PATH:?}/"* 2> /dev/null

sleep "$TIMEOUT_START"

while true; do
    if [ -z "$(ls -A "$RUN_PATH")" ]; then
        echo "Directory '$RUN_PATH' is empty. Shutting down."
        poweroff
    else
        echo "Directory is not empty. Checking again in $TIMEOUT_CHECK seconds..."
    fi

    sleep "$TIMEOUT_CHECK"
done
