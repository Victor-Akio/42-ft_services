#!/bin/sh

# kubectl delete -f ./srcs/wordpress/wordpress.yaml
# eval $(minikube docker-env)
# docker build srcs/wordpress -t wordpress-img
# kubectl apply -f ./srcs/wordpress/wordpress.yaml

# kubectl delete -f ./srcs/phpmyadmin/phpmyadmin.yaml
# eval $(minikube docker-env)
# docker build srcs/phpmyadmin -t phpmyadmin-img
# kubectl apply -f ./srcs/phpmyadmin/phpmyadmin.yaml

# kubectl delete -f ./srcs/ftps/ftps.yaml
# eval $(minikube docker-env)
# docker build srcs/ftps -t ftps-img
# kubectl apply -f ./srcs/ftps/ftps.yaml

# kubectl delete -f ./srcs/grafana/grafana.yaml
# kubectl delete -f ./srcs/influxdb/influxdb.yaml
# eval $(minikube docker-env)
# docker build srcs/grafana -t grafana-img
# docker build srcs/influxdb -t influxdb-img
# kubectl apply -f ./srcs/grafana/grafana.yaml
# kubectl apply -f ./srcs/influxdb/influxdb.yaml