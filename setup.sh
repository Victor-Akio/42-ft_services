#!/bin/bash

echo -e "Minikube Run ..."
minikube start --driver=virtualbox --alsologtostderr -v=2 #> /dev/null

echo -e "Enabling Addons ..."
minikube addons enable dashboard

echo -e "Loading MetalLB ..."
kubectl apply -f metallb.yaml > /dev/null
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

echo -e "Preparing Pods ..."
eval $(minikube docker-env)
docker build srcs/nginx -t nginx_services
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
kubectl apply -f srcs --recursive