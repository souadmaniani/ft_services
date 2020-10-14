FROM alpine:latest
RUN apk update 
RUN apk add lighttpd php7-common php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom
RUN apk add vim wget openrc
COPY lighttpd.conf /etc/lighttpd/lighttpd.conf
COPY mod_fastcgi.conf /etc/lighttpd/mod_fastcgi.conf
RUN mkdir /run/openrc/
RUN chmod 777 /run/openrc
RUN touch /run/openrc/softlevel
RUN rc-status
RUN rc-service lighttpd start && rc-update add lighttpd default
COPY setup.sh /setup.sh
RUN sh /setup.sh
COPY wp-config.php /usr/share/webapps/wordpress/
RUN mv /usr/share/webapps/wordpress/* /var/www/localhost/htdocs
COPY start.sh /start.sh
ENTRYPOINT sh /start.sh
EXPOSE 5050
