#!/bin/bash

function apply {
    kubectl apply -f storage.yaml
    kubectl apply -f configmap.yaml
    kubectl apply -f deployment.yaml
    kubectl wait --for=condition=available --timeout=600s deployment/rsyslog-server -n gic-wesago
    kubectl apply -f service.yaml
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
