#!/bin/sh

if [[ ! -d /var/run/nginx ]]; then
	mkdir -p /var/run/nginx
fi

if [[ ! -f /var/www/phpmyadmin/index.php ]]; then

	curl -SL https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.zip \
	| tar -xJC /var/www/phpmyadmin --strip 1

fi

php-fpm7 & nginx -g "daemon off;"