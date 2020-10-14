#!/bin/bash
DB_DATA_PATH="/var/lib/mysql"
DB_USER="souad"
DB_PASS="souad"
DB_ROOT_PASS="souad"
# SOCKET="/run/mysqld/mysql.sock"
/usr/bin/mysql_install_db --user=mysql
/usr/bin/mysqld_safe --datadir="/var/lib/mysql"
rc-status
/etc/init.d/mariadb setup
/etc/init.d/mariadb start
sleep 7
mysqladmin -u root password "${DB_ROOT_PASS}"
mysql -u root -e "CREATE DATABASE wordpress_db;"
mysql -u root -e "CREATE USER ${DB_USER}@'%' IDENTIFIED BY '${DB_PASS}';"
mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO ${DB_USER}@'%';"
mysql -u root -e "FLUSH PRIVILEGES;"
tail -f /dev/null