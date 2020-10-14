#!/bin/bash
minikube delete
export MINIKUBE_HOME=~/goinfre/ && minikube start --vm-driver=virtualbox  --extra-config=apiserver.service-node-port-range=1-32000
minikube addons enable ingress
eval $(minikube docker-env)

# docker build srcs/nginx -t my_nginx
# sed -i '' "s/minikubeip/$(minikube ip)/g" srcs/ftps/Dockerfile
# docker build srcs/ftps -t my_ftps
# docker build srcs/sql -t my_sql
# docker build srcs/wordpress -t my_phpmyadmin
# docker build srcs/wordpress -t my_wordpress
# docker build srcs/influxdb -t my_influxdb
# docker build srcs/telegraf -t my_telegraf
# docker build srcs/grafana -t my_grafana

# kubectl create -f srcs/nginx/
# kubectl create -f srcs/ftps/
# kubectl create -f srcs/sql/
# kubectl create -f srcs/phpmyadmin/
# kubectl create -f srcs/wordpress/
# kubectl create -f srcs/influxdb 
# kubectl create -f srcs/telegraf
# kubectl create  -f srcs/grafana
# open http://$(minikube ip)
# minikube service list