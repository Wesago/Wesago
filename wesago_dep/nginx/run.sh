#!/bin/bash

function apply {
    echo "creating configMap..."
    kubectl create configmap nginx-wesago-conf --namespace=gic-wesago --from-file=nginx.conf
    sleep 5

    kubectl apply -f deployment.yaml
    kubectl apply -f service.yaml
    kubectl apply -f ingress.yaml
}

function delete {
    kubectl delete -f .
    kubectl delete configmap nginx-wesago-conf --namespace=gic-wesago
}

if [ "$1" == "apply" ]; then
    apply
elif [ "$1" == "delete" ]; then
    delete
else
    echo "Invalid argument. Please provide 'apply' or 'delete'."
fi
