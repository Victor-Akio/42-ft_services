#!/bin/sh

kubectl delete -f ./srcs/phpmyadmin/phpmyadmin.yaml
eval $(minikube docker-env)
docker build srcs/phpmyadmin -t phpmyadmin-img
kubectl apply -f ./srcs/phpmyadmin/phpmyadmin.yaml
