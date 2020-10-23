#!bin/bash
mkdir -p /usr/share/webapps/
cd /usr/share/webapps/
wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.1-all-languages.tar.gz
tar zxvf phpMyAdmin-5.0.1-all-languages.tar.gz
rm phpMyAdmin-5.0.1-all-languages.tar.gz
mv phpMyAdmin-5.0.1-all-languages phpmyadmin
# mkdir /var/www/localhost/htdocs/tmp
# chmod 777 /var/www/localhost/htdocs/tmp
chmod -R 777 /usr/share/webapps/
# For the Nginx web server to find and serve the phpMyAdmin files correctly,
# we just need to create a symbolic link from the installation files to our 
# Nginx document root directory 
ln -s /usr/share/webapps/phpmyadmin /var/www/localhost/htdocs/phpmyadmin
