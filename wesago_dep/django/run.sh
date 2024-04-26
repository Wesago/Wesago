#!/bin/bash

function apply {
    echo "storage.yaml"
    kubectl apply -f storage.yaml
    sleep 5

    echo "secret.yaml"
    kubectl apply -f secret.yaml

    echo "configMap.yaml"
    kubectl apply -f configMap.yaml

    echo "migration-job.yaml"
    kubectl apply -f migration-job.yaml
    sleep 30

    echo "collectstatic-job.yaml"
    kubectl apply -f collectstatic-job.yaml
    sleep 30

    echo "deployment.yaml"
    kubectl apply -f deployment.yaml

    echo "service.yaml"
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
