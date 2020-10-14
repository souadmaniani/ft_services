FROM alpine:latest
RUN apk update && \
    apk add mariadb mariadb-client
# openrc contient rc-service
RUN apk add openrc vim
RUN mkdir /run/openrc/
RUN chmod 777 /run/openrc
RUN touch /run/openrc/softlevel
COPY mariadb-server.cnf /etc/my.cnf.d/
COPY start.sh /
ENTRYPOINT sh /start.sh
EXPOSE 3306
