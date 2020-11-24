FROM alpine:latest
RUN apk update && \
    apk add mariadb mariadb-client
# openrc contient rc-service
RUN apk add openrc vim
RUN mkdir /run/openrc/
RUN chmod 777 /run/openrc
RUN touch /run/openrc/softlevel
COPY mariadb-server.cnf /etc/my.cnf.d/
COPY wordpress_db1.sql /
COPY script.sh /
COPY start.sh /
ENTRYPOINT sh /start.sh
EXPOSE 3306
