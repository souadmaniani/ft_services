#!bin/sh

# # /etc/init.d/sshd start
# # nginx -g "daemon off;"
# # start supervisord 
# /usr/bin/supervisord -c /etc/supervisord.conf 
# # start programs
# supervisorctl start nginx
# supervisorctl start sshd
# rc-service sshd start
supervisord --nodaemon --configuration /etc/supervisord.conf