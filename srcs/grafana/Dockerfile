FROM alpine:3.9.3

ENV GRAFANA_VERSION 6.6.2
ENV GLIBC_VERSION 2.27-r0

# Installing packages
# --no-cache option for apk it allows users to install packages with an index 
# that is updated and used on-the-fly and not cached locally
# OpenSSL est une boîte à outils de chiffrement 
RUN apk add --no-cache su-exec ca-certificates openssl vim wget
RUN apk add --no-cache --virtual .build-deps fontconfig

RUN wget https://dl.grafana.com/oss/release/grafana-6.6.2.linux-amd64.tar.gz
RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub
RUN wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.31-r0/glibc-2.31-r0.apk
RUN apk add glibc-2.31-r0.apk

RUN addgroup grafana && \
    adduser -s /bin/false -G grafana -S -D grafana
RUN tar -zxvf grafana-6.6.2.linux-amd64.tar.gz && \
    mv grafana-${GRAFANA_VERSION} /grafana && \
    mkdir -p /var/lib/grafana/dashboards /var/lib/grafana/data /var/lib/grafana/logs /var/lib/grafana/plugins && \
    ln -s /grafana/plugins /var/lib/grafana/plugins && \
    mv /grafana/bin/* /usr/bin/ && \
    grafana-cli plugins update-all && \
    rm -f /grafana/conf/*.ini grafana-$GRAFANA_VERSION.linux-x64.tar.gz && \
    apk del .build-deps
COPY defaults.ini /grafana/conf/
COPY grafana.db /grafana/data/
COPY start.sh /start.sh
COPY script.sh /script.sh
ENTRYPOINT sh start.sh
EXPOSE 3000