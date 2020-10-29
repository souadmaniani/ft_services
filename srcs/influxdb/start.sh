#!/bin/bash

# rc-service influxdb start
influx -execute="CREATE DATABASE influxdb_db;"
influx -execute="CREATE USER souad WITH PASSWORD 'souad' WITH ALL PRIVILEGES;"
# exec /usr/bin/telegraf
supervisord --nodaemon --configuration /etc/supervisord.conf

