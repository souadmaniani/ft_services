FROM alpine:latest

ENV TELEGRAF_VERSION 1.6.3

# Downloading Telegraf
ADD https://dl.influxdata.com/telegraf/releases/telegraf-${TELEGRAF_VERSION}-static_linux_amd64.tar.gz ./
COPY start.sh /

# Installing packages
RUN tar -C . -xzf telegraf-${TELEGRAF_VERSION}-static_linux_amd64.tar.gz && \
        chmod +x telegraf/* && \
        cp telegraf/telegraf /usr/bin/ && \
        rm -rf *.tar.gz* telegraf/ 

ENTRYPOINT sh start.sh
