#!/bin/sh

gpsd -r -D3 -n -N -S ${GPSD_LISTENER_PORT} ${GPSD_SOURCE} &
GPSD_PID=$!
echo "GPSD_PID is: $GPSD_PID"
./gpsd_feeder.py
