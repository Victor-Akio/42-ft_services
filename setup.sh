#!/bin/sh

echo -e "Minikube Run ..."
echo -e "Might take a while to install everything and get the cluster ready."
minikube start --cpus=2 --vm-driver=docker --bootstrapper=kubeadm				\
				   --extra-config=kubelet.authentication-token-webhook=true		\
				   --extra-config=apiserver.service-node-port-range=3000-35000

# IF, you do not have Metallb addon in your minikube, you can download the manifest.
# and "comment" "enable metallb" line in Enabling Addons section.
# -------------------------------------
# echo -e "Setting Load balancer ..."
# kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.8.1/manifests/namespace.yaml 
# kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.8.1/manifests/metallb.yaml 
# echo -e "If already exists a member list, It will show an Error Message, but it is okay..."
# kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)" 

echo -e "Enabling Addons ..."
minikube addons enable metrics-server
minikube addons enable dashboard
minikube addons enable metallb

echo -e "Loading MetalLB ..."
kubectl apply -f ./srcs/metallb-config.yaml

echo -e "Launching Pods ..."
eval $(minikube docker-env)
docker build srcs/nginx -t nginx-img
docker build srcs/ftps -t ftps-img
docker build srcs/wordpress -t wordpress-img
docker build srcs/mysql -t mysql-img
docker build srcs/phpmyadmin -t phpmyadmin-img
docker build srcs/grafana -t grafana-img
docker build srcs/influxdb -t influxdb-img

echo -e "Configure Minikube ..."
kubectl apply -f ./srcs/nginx/nginx.yaml
kubectl apply -f ./srcs/ftps/ftps.yaml
kubectl apply -f ./srcs/mysql/mysql.yaml
kubectl apply -f ./srcs/wordpress/wordpress.yaml
kubectl apply -f ./srcs/phpmyadmin/phpmyadmin.yaml
kubectl apply -f ./srcs/influxdb/influxdb.yaml
kubectl apply -f ./srcs/grafana/grafana.yaml

echo -e "You can now proceed."
