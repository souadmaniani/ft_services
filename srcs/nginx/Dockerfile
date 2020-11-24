# OpenSSH is a popular SSH implementation for remote encrypted login to a machine.
# OpenSSH defines sshd as the daemon, and ssh as the client program.
# ssh souad@minikubeip
FROM alpine:latest

RUN apk update
RUN apk add nginx openssh
RUN mkdir /run/nginx/
RUN apk add openrc vim
RUN echo "<h5>Welcome to nginx!!!</h5>" > /var/www/localhost/htdocs/index.html
RUN mkdir /run/openrc/
RUN chmod 777 /run/openrc
RUN touch /run/openrc/softlevel
COPY nginx.crt /etc/ssl/certs/nginx.crt
COPY nginx.key /etc/ssl/private/nginx.key
COPY default.conf /etc/nginx/conf.d/default.conf
# Enable the sshd service so that it starts at boot:
# RUN rc-update add sshd default
RUN rc-status
# RUN rc-status
RUN adduser -D souad \
&& echo souad:souad | chpasswd \
&& echo "root:root" | chpasswd \
&& mkdir /root/.ssh \
&& chmod 0700 /root/.ssh \
&& ssh-keygen -A
COPY start.sh /start.sh
COPY script.sh /script.sh
RUN chmod 777 /start.sh
RUN chmod 777 /script.sh
# RUN apk add supervisor
# RUN mkdir -p /var/log/supervisor
# RUN rm /etc/supervisord.conf
# COPY supervisord.conf /etc/supervisord.conf
# ENTRYPOINT ["supervisord", "--nodaemon", "--configuration", "/etc/supervisord.conf"]
ENTRYPOINT sh start.sh
EXPOSE 80 443 22
