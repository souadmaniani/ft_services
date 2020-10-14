FROM alpine:latest

RUN apk update
RUN apk add nginx openssh
RUN mkdir /run/nginx/
RUN apk add openrc vim
RUN echo "<h1>Welcome to nginx!!!</h1>" > /var/www/localhost/htdocs/index.html
RUN mkdir /run/openrc/
RUN chmod 777 /run/openrc
RUN touch /run/openrc/softlevel
COPY default.conf /etc/nginx/conf.d/default.conf
RUN rc-update add sshd
RUN rc-status
COPY start.sh /start.sh
ENTRYPOINT sh start.sh