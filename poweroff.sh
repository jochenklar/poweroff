#!/usr/bin/env bash

RUN_PATH=/tmp/poweroff
TIMEOUT_START=180
TIMEOUT_CHECK=30

mkdir $RUN_PATH

# optionally, change ownership
# chown <user>:<user> $RUN_PATH

rm -rf "${RUN_PATH:?}/"* 2>/dev/null

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
