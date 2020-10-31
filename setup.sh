#!/bin/sh

echo -e "Minikube Run ..."
echo -e "Might take a while to install everything and get the cluster ready."
minikube start --cpus=2 --vm-driver=sudo docker --bootstrapper=kubeadm				\
				   --extra-config=kubelet.authentication-token-webhook=true		\
				   --extra-config=apiserver.service-node-port-range=3000-35000 > /dev/null

# IF, you do not have Metallb addon in your minikube, you can download the manifest.
# and "comment" "enable metallb" line in Enabling Addons section.
# -------------------------------------
# echo -e "Setting Load balancer ..."
# kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.8.1/manifests/namespace.yaml #> /dev/null
# kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.8.1/manifests/metallb.yaml #> /dev/null
# echo -e "If already exists a member list, It will show an Error Message, but it is okay..."
# kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)" #> /dev/null

echo -e "Enabling Addons ..."
minikube addons enable metrics-server > /dev/null
minikube addons enable dashboard > /dev/null
minikube addons enable metallb > /dev/null

echo -e "Loading MetalLB ..."
kubectl apply -f ./srcs/metallb-config.yaml > /dev/null

echo -e "Launching Pods ..."
eval $(minikube docker-env)
sudo docker build srcs/nginx -t nginx-img > /dev/null
sudo docker build srcs/ftps -t ftps-img > /dev/null
sudo docker build srcs/wordpress -t wordpress-img > /dev/null
sudo docker build srcs/mysql -t mysql-img > /dev/null
sudo docker build srcs/phpmyadmin -t phpmyadmin-img > /dev/null
sudo docker build srcs/grafana -t grafana-img > /dev/null
sudo docker build srcs/influxdb -t influxdb-img > /dev/null

echo -e "Configure Minikube ..."
kubectl apply -f ./srcs/nginx/nginx.yaml > /dev/null
kubectl apply -f ./srcs/ftps/ftps.yaml > /dev/null
kubectl apply -f ./srcs/mysql/mysql.yaml > /dev/null
kubectl apply -f ./srcs/wordpress/wordpress.yaml > /dev/null
kubectl apply -f ./srcs/phpmyadmin/phpmyadmin.yaml > /dev/null
kubectl apply -f ./srcs/influxdb/influxdb.yaml > /dev/null
kubectl apply -f ./srcs/grafana/grafana.yaml > /dev/null

echo -e "You can now proceed."
