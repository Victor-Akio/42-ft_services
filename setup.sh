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
kubectl apply -f ./srcs/metallb.yaml #> /dev/null

echo -e "Preparing Pods ..."
eval $(minikube docker-env)
docker build srcs/nginx -t nginx-services > /dev/null
docker build srcs/ftps -t ftps-services > /dev/null
#docker build srcs/mysql -t mysql-services > /dev/null
docker build srcs/wordpress -t wordpress-services > /dev/null
#docker build srcs/phpmyadmin -t phpmyadmin-services > /dev/null
#docker build srcs/php -t php-services > /dev/null
#docker build srcs/grafana -t grafana-services > /dev/null
#docker build srcs/influxdb -t influxdb-services > /dev/null
#docker build srcs/telegraf -t telegraf-services > /dev/null

echo -e "Configure Minikube ..."
kubectl apply -f ./srcs/nginx/nginx.yaml > /dev/null
kubectl apply -f ./srcs/ftps/ftps.yaml > /dev/null
kubectl apply -f ./srcs/wordpress/wp.yaml > /dev/null