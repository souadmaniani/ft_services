#!/bin/bash
minikube delete
export MINIKUBE_HOME=~/goinfre/ && minikube start --vm-driver=virtualbox

eval $(minikube docker-env)

# # install metallb ----> Installation By Manifest

kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
# # On first install only
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
# # kubectl get pods -n metallb-system
# # CONFIGURATION of matallb
# # kubectl get nodes -o wide
sed -i '' "s/minikubeip/$(minikube ip)/g" srcs/config.yaml
sed -i '' "s/minikubeip/$(minikube ip)/g" srcs/sql/wordpress_db1.sql
kubectl apply -f srcs/config.yaml

docker build srcs/nginx -t my_nginx
sed -i '' "s/minikubeip/$(minikube ip)/g" srcs/ftps/Dockerfile
docker build srcs/ftps -t my_ftps
# docker build srcs/sql -t my_sql
# docker build srcs/phpmyadmin -t my_phpmyadmin
# docker build srcs/wordpress -t my_wordpress
# docker build srcs/influxdb -t my_influxdb
# docker build srcs/telegraf -t my_telegraf
# docker build srcs/grafana -t my_grafana

kubectl create -f srcs/nginx/
kubectl create -f srcs/ftps/
# kubectl create -f srcs/sql/
# kubectl create -f srcs/phpmyadmin/
# kubectl create -f srcs/wordpress/
# kubectl create -f srcs/influxdb 
# kubectl create -f srcs/telegraf
# kubectl create  -f srcs/grafana
open http://$(minikube ip)
# minikube service list

# Note: If you are running your service on Minikube, you can find the assigned IP address and port with:
# minikube service nginx --url

# https://airbrake.io/blog/http-errors/307-temporary-redirect

# # Obtenir un shell dans un conteneur 
# kubectl get pods
# kubectl exec -it wordpress-mysql-774fcf78c8-qqmk6  -- /bin/sh
# rm -rf ~/Library/'**.42_cache_bak_**'; rm -rf ~/'**.42_cache_bak_**';