#!bin/sh
adduser -D souad
echo souad:souad | chpasswd
/etc/init.d/sshd start
nginx -g "daemon off;"