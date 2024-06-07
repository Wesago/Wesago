#!/bin/bash

# ./run.sh apply, ./run.sh delete, ./run.sh images, ./run.sh clear, ./run.sh all

NAMESPACE="gic-wesago"
declare -a arr=("website_dep/" "wesago_dep/" "monitoring/")
len=${#arr[@]}

function apply {

   for i in "${arr[@]}"
   do
      echo "Running $i"
      cd $i
      bash run.sh apply
      cd ..
   done

}

function delete {

   # Loop through the array in reverse order
   for (( i=$len-1; i>=0; i-- ))
   do
      echo "Running ${arr[i]}"
      cd "${arr[i]}"
      bash run.sh delete
      cd ..
   done
}

function images {

   # website_dep nginx
   docker build -t registry.deti/${NAMESPACE}/nginxwebsite:v1 -f website_dep/nginx/Dockerfile website_dep/nginx
   docker push registry.deti/${NAMESPACE}/nginxwebsite:v1

   # website_dep react
   docker build -t registry.deti/${NAMESPACE}/websitejob:v1 -f website_dep/react/Dockerfile website_dep/react
   docker push registry.deti/${NAMESPACE}/websitejob:v1

   # wesago_dep django
   docker build -t registry.deti/${NAMESPACE}/wesago-django:v1 -f wesago_dep/django/Dockerfile .
   docker push registry.deti/${NAMESPACE}/wesago-django:v1

   # wesago_dep nginx
   docker build -t registry.deti/${NAMESPACE}/nginx:v1 -f wesago_dep/nginx/Dockerfile wesago_dep/nginx
   docker push registry.deti/${NAMESPACE}/nginx:v1

   # wesago_dep postgres
   docker build -t registry.deti/${NAMESPACE}/postgres:v1 -f wesago_dep/postgres/Dockerfile wesago_dep/postgres
   docker push registry.deti/${NAMESPACE}/postgres:v1

   # wesago_dep redis
   docker build -t registry.deti/${NAMESPACE}/redis:v1 -f wesago_dep/redis/Dockerfile wesago_dep/redis
   docker push registry.deti/${NAMESPACE}/redis:v1

   # wesago_dep rsyslog
   docker build -t registry.deti/${NAMESPACE}/rsyslog-server:v1 -f wesago_dep/rsyslog/Dockerfile wesago_dep/rsyslog
   docker push registry.deti/${NAMESPACE}/rsyslog-server:v1

   # monitor_dep healthcheck
   docker build -t registry.deti/${NAMESPACE}/health-checker:v1 -f wesago_dep/healthcheck/Dockerfile wesago_dep/healthcheck
   docker push registry.deti/${NAMESPACE}/health-checker:v1

   # monitor_dep grafana
   docker build -t registry.deti/${NAMESPACE}/grafana:v1 -f monitoring/grafana/Dockerfile monitoring/grafana
   docker push registry.deti/${NAMESPACE}/grafana:v1

}

function clear {

   # kubectl delete namespace
   kubectl delete namespace ${NAMESPACE}
   # create namespace
   kubectl create namespace ${NAMESPACE}
}


if [ "$1" == "apply" ]; then
   apply
elif [ "$1" == "delete" ]; then
   delete
elif [ "$1" == "images" ]; then
   images
elif [ "$1" == "clear" ]; then
   clear
elif [ "$1" == "all" ]; then
   clear
   images
   apply
else
   echo "Invalid argument. Please provide 'apply', 'delete', 'images', 'clear' or 'all'."
fi


