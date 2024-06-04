#!/bin/bash

function apply {

   # configmap
   kubectl create configmap nginx-website-conf --namespace=gic-wesago --from-file=nginx.conf
   # deployment
   kubectl apply -f deployment.yaml
   kubectl autoscale deployment nginx-website --namespace=gic-wesago --cpu-percent=70 --min=1 --max=5 
   # service
   kubectl apply -f service.yaml

}

function delete {

    # service
    kubectl delete -f service.yaml
    # deployment
    kubectl delete -f deployment.yaml
    # configmap
    kubectl delete configmap nginx-website-conf

}

if [ "$1" == "apply" ]; then
   apply
elif [ "$1" == "delete" ]; then
   delete
else
   echo "Invalid argument. Please provide 'apply' or 'delete'."
fi
