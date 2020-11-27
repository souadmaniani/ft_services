#!/bin/bash

# # # start minikube # # #
export MINIKUBE_HOME=~/goinfre/ && minikube start --vm-driver=virtualbox

eval $(minikube docker-env)

# # # install metallb ----> Installation By Manifest 
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml

kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml

kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

# # # CONFIGURATION of matallb
sed -i '' "s/minikubeip/$(minikube ip)/g" srcs/config.yaml 
kubectl create -f srcs/config.yaml

sed -i '' "s/minikubeip/$(minikube ip)/g" srcs/sql/wordpress_db1.sql
sed -i '' "s/minikubeip/$(minikube ip)/g" srcs/phpmyadmin/default.conf
sed -i '' "s/minikubeip/$(minikube ip)/g" srcs/phpmyadmin/config.inc.php
sed -i '' "s/minikubeip/$(minikube ip)/g" srcs/wordpress/default.conf
sed -i '' "s/minikubeip/$(minikube ip)/g" srcs/nginx/default.conf
sed -i '' "s/minikubeip/$(minikube ip)/g" srcs/ftps/Dockerfile

# # # build images # # #
docker build srcs/nginx -t my_nginx
docker build srcs/ftps -t my_ftps
docker build srcs/sql -t my_sql
docker build srcs/phpmyadmin -t my_phpmyadmin
docker build srcs/wordpress -t my_wordpress
docker build srcs/influxdb -t my_influxdb
docker build srcs/grafana -t my_grafana

# # # create containers # # #
kubectl apply -f srcs/nginx/
kubectl apply -f srcs/ftps/
kubectl apply -f srcs/sql/
kubectl apply -f srcs/phpmyadmin/
kubectl apply -f srcs/wordpress/
kubectl apply -f srcs/influxdb 
kubectl apply  -f srcs/grafana

open http://$(minikube ip)
minikube dashboard

