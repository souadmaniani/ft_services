

mkdir -p /usr/share/webapps/
cd /usr/share/webapps/
wget http://wordpress.org/latest.tar.gz
tar -xzvf latest.tar.gz
rm latest.tar.gz
# chown -R nginx /usr/share/webapps/
chmod -R 777 /usr/share/webapps/
# rm -rf  /var/www/localhost/htdocs/wordpress
ln -s /usr/share/webapps/wordpress /var/www/localhost/htdocs/wordpress
# echo $?  > file
# ls   /var/www/localhost/htdocs/wordpress/* > ls
# ls -la /var/www/localhost/htdocs/wordpress/*