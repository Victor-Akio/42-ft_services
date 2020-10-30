#!/bin/sh

# kubectl delete -f ./srcs/wordpress/wordpress.yaml
# eval $(minikube docker-env)
# docker build srcs/wordpress -t wordpress-img
# kubectl apply -f ./srcs/wordpress/wordpress.yaml

# kubectl delete -f ./srcs/phpmyadmin/phpmyadmin.yaml
# eval $(minikube docker-env)
# docker build srcs/phpmyadmin -t phpmyadmin-img
# kubectl apply -f ./srcs/phpmyadmin/phpmyadmin.yaml

kubectl delete -f ./srcs/ftps/ftps.yaml
eval $(minikube docker-env)
docker build srcs/ftps -t ftps-img
kubectl apply -f ./srcs/ftps/ftps.yaml