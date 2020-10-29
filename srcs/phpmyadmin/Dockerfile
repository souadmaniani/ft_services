FROM alpine:latest
RUN apk update 

RUN apk add php7-common php7-iconv php7-json php7-gd\
 php7-curl php7-xml php7-mysqli php7-imap php7-cgi\
 fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc\
  php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7 php7-fpm php7-opcache \
  php7-zlib  php7-dom  php7-session php7-mbstring nginx 


RUN apk add vim wget openrc
COPY default.conf /etc/nginx/conf.d/default.conf
# RUN mkdir /etc/nginx/snippets
# COPY phpmyadmin.conf /etc/nginx/snippets
RUN mkdir /run/openrc/
RUN chmod 777 /run/openrc
RUN touch /run/openrc/softlevel
RUN rc-status
RUN echo "<h5>Welcome to nginx!!!</h5>" > /var/www/localhost/htdocs/index.html
# RUN rc-update add nginx default
# RUN rc-update add php-fpm7 default
RUN mkdir -p /run/nginx
RUN mkdir -p /var/run/php
RUN mkdir -p /var/log/php-fpm

COPY www.conf /etc/php7/php-fpm.d/www.conf
# RUN rc-service nginx start
COPY setup.sh /setup.sh
RUN sh /setup.sh
# RUN mv /usr/share/webapps/phpmyadmin/* /var/www/localhost/htdocs
RUN rm /usr/share/webapps/phpmyadmin/config.sample.inc.php 
COPY config.inc.php /usr/share/webapps/phpmyadmin
RUN apk add supervisor
RUN mkdir -p /var/log/supervisor
COPY supervisord.conf /etc/
COPY start.sh /
ENTRYPOINT sh /start.sh
EXPOSE 5000
