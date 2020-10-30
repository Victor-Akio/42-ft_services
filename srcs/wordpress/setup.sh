#!/bin/sh

if [[ ! -d /var/run/nginx ]]; then
	mkdir -p /var/run/nginx
fi

if [[ ! -f /var/www/wordpress/index.php ]]; then
	
	curl -SL https://wordpress.org/wordpress-5.5.1.tar.gz \
	| tar -xzC /var/www/wordpress --strip 1

	tfile=`mktemp`
	cat > $tfile << EOF
FLUSH PRIVILEGES;
CREATE DATABASE IF NOT EXISTS wordpress;
CREATE USER '$USERNAME'@'%' IDENTIFIED BY '$PASSWORD';
GRANT ALL PRIVILEGES ON wordpress.* TO '$USERNAME'@'%' WITH GRANT OPTION;
EOF

	mysql -hmysql -uroot -p$MYSQL_ROOT_PASSWORD < $tfile
	rm -f $tfile
	
fi

adduser --no-create-home -D $USERNAME
echo "$USERNAME:$PASSWORD" | chpasswd
chmod -R 755 /var/www/
chown -R $USERNAME:$USERNAME /var/www/wordpress

#PHP_CGI_FIX_PATHINFO=0
sed -i "s|;*cgi.fix_pathinfo=.*|cgi.fix_pathinfo= 0 |i" /etc/php7/php.ini

php-fpm7 & nginx -g "daemon off;"