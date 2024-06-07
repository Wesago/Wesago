#!/bin/bash

function apply {
    kubectl apply -f configmap.yaml
    kubectl apply -f configmap-dashboards.yaml
    kubectl apply -f deployment.yaml
    kubectl apply -f service.yaml
    kubectl apply -f ingress.yaml
}

function delete {
    kubectl delete -f .
}

if [ "$1" == "apply" ]; then
    apply
elif [ "$1" == "delete" ]; then
    delete
else
    echo "Invalid argument. Please provide 'apply' or 'delete'."
fi
