#!/bin/bash

echo -e "Minikube Run ..."
echo -e "Might take a while to install everything and get the cluster ready."
minikube start --cpus=2 --vm-driver=docker > /dev/null

echo -e "Setting Load balancer ..."
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml > /dev/null
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml > /dev/null
echo -e "If already exists a member list, It will show an Error Message..."
#kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)" > /dev/null

echo -e "Enabling Addons ..."
minikube addons enable metrics-server
minikube addons enable dashboard
minikube addons enable metallb

echo -e "Loading MetalLB ..."
kubectl apply -f ./metallb.yaml #> /dev/null

echo -e "Preparing Pods ..."
eval $(minikube docker-env)
docker build srcs/nginx -t nginx_services > /dev/null
#docker build srcs/nginx/ssh -t ssh_services
#docker build srcs/ftps -t ftps_services
#docker build srcs/mysql -t mysql_services
#docker build srcs/wordpress -t wordpress_services
#docker build srcs/phpmyadmin -t phpmyadmin_services
#docker build srcs/php -t php_services
#docker build srcs/grafana -t grafana_services
#docker build srcs/influxdb -t influxdb_services
#docker build srcs/telegraf -t telegraf_services

echo -e "Configure Minicube ..."
kubectl apply -f ./srcs/nginx/nginx.yaml > /dev/null