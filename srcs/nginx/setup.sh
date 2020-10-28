#!/bin/sh

# sed -i -e 's@$(SERVER_IP)@'$SERVER_IP'@' /etc/nginx/conf.d/default.conf
adduser -D "$SSH_USER"
echo "$SSH_USER:$SSH_PASSWORD" | chpasswd

/usr/sbin/sshd
/usr/sbin/nginx -g 'daemon off;'