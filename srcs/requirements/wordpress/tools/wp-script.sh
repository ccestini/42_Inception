#!/bin/bash

# These folders are used to store WordPress files in the container.
mkdir -p /var/www/ /var/www/html
cd /var/www/html
rm -rf *

# curl: The command-line tool for making HTTP requests. It is used to transfer data to or from a server.
# wp-cli: WordPress Command-Line Interface is a tool for performing administartion tasks to managing WP websites.
# move and change name to wp to use it as cmd(as its in system path usr/local/bin)
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

# get wordpress file, unzip it & remove the zip file
wget https://wordpress.org/latest.tar.gz && \
tar -xvzf latest.tar.gz && \
rm -rf latest.tar.gz
# copy contents of worpress folder into the container
cp -r wordpress/* /var/www/html/
#remove the wordpress folder that was downloaded earlier from latest.tar
rm -rf /wordpress

#copy wordpress config file into the container
cp /wp-config.php /var/www/html/wp-config.php

# replace contents of config file with the environment variables
sed -i -r "s/db_name_string/${DB_NAME}/g"   wp-config.php
sed -i -r "s/db_user_string/${DB_USER}/g"  wp-config.php
sed -i -r "s/db_pwd_string/${DB_USER_PASS}/g"    wp-config.php

# core: Download, install, update and otherwise manage WordPress.
wp core install --path=/var/www/html/ --url=ccestini.42.fr --title="Inception by Cris" --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root

# creates another user
wp user create --path=/var/www/html/ $WP_USER $WP_EMAIL --role=contributor --user_pass=$WP_PWD --allow-root

# the ownership of all files and directories within /var/www/html/ will be given to www-data:www-data(user:group)
# www-data (user:group) are commonly used in web server environments, such as Nginx, to ensure proper permissions for serving web content.
chown -R www-data:www-data /var/www/html/

# set the listen directive in the PHP-FPM configuration file to 0.0.0.0:9000 for incomming request
sed -i 's/listen = .*/listen = 0.0.0.0:9000/g' /etc/php/7.4/fpm/pool.d/www.conf

#theme
wp theme install twentytwentyone --activate --allow-root

# Start PHP-FPM and the custom script in the "foreground" mode
php-fpm7.4 -F
