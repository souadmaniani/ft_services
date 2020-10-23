
#!bin/sh
rc-service php-fpm7 restart
rc-service nginx restart
tail -f /dev/null

