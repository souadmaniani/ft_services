FROM alpine:latest

ENV INFLUXDB_VERSION 1.5.3

# Installing packages
RUN apk add --no-cache su-exec

# Downloading binaries
ADD https://dl.influxdata.com/influxdb/releases/influxdb-${INFLUXDB_VERSION}-static_linux_amd64.tar.gz ./
RUN addgroup influxdb && \
        adduser -s /bin/false -G influxdb -S -D influxdb
COPY start.sh /

# Installing binaries
RUN tar -C . -xzf influxdb-${INFLUXDB_VERSION}-static_linux_amd64.tar.gz && \
        chmod +x influxdb-*/* && \
        cp -a influxdb-*/* /usr/bin/ && \
        rm -rf *.tar.gz* influxdb-*/
ENTRYPOINT sh start.sh
EXPOSE 8086