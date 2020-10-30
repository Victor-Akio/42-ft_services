#!/bin/sh

openssl req -newkey rsa:2048 -x509 -days 365 -nodes \
        -keyout /etc/ssl/private/vsftpd.key \
        -out /etc/ssl/certs/vsftpd.crt -subj \
        "/C=BR/ST=Sao Paulo/L=Sao Paulo/O=42SP, Inc./OU=IT/CN=ft_services"

#In this case, the User and Password are related to the VM used to correct the project.
mkdir -p /var/ftp
adduser -D -h /var/ftp $USERNAME
echo "$USERNAME:$PASSWORD" | chpasswd

vsftpd /etc/vsftpd/vsftpd.conf