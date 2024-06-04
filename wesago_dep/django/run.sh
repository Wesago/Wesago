#!/bin/bash

function apply {
    echo "storage.yaml"
    kubectl apply -f storage.yaml
    sleep 5

    echo "secret.yaml"
    kubectl apply -f secret.yaml

    echo "configMap.yaml"
    kubectl apply -f configmap.yaml

    echo "migration-job.yaml"
    kubectl apply -f migration-job.yaml
    kubectl wait --for=condition=Complete --timeout=200s job/wesago-db-migrations -n gic-wesago 

    echo "collectstatic-job.yaml"
    kubectl apply -f collectstatic-job.yaml
    kubectl wait --for=condition=Complete --timeout=200s job/wesago-collectstatic -n gic-wesago 

    echo "createsuperuser-job.yaml"
    kubectl apply -f createsuperuser-job.yaml
    kubectl wait --for=condition=Complete --timeout=200s job/wesago-createsuperuser -n gic-wesago 

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
