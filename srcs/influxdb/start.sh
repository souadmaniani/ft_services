#!/bin/bash

chown -R influxdb:influxdb /var/lib/influxdb
influxd &
influx -execute="CREATE DATABASE influxdb_db;"
influx -execute="CREATE USER souad WITH PASSWORD 'souad' WITH ALL PRIVILEGES;"
tail -f /dev/null