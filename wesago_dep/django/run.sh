#!/bin/bash

function apply {
    kubectl wait -n gic-wesago --for=jsonpath='{.status.phase}'=Running pod/redis-0 --timeout=300s
    kubectl wait -n gic-wesago --for=jsonpath='{.status.phase}'=Running pod/redis-1 --timeout=300s
    kubectl wait -n gic-wesago --for=jsonpath='{.status.phase}'=Running pod/redis-2 --timeout=300s
    kubectl wait -n gic-wesago --for=jsonpath='{.status.phase}'=Running pod/sentinel-0 --timeout=300s
    kubectl wait -n gic-wesago --for=jsonpath='{.status.phase}'=Running pod/sentinel-1 --timeout=300s
    kubectl wait -n gic-wesago --for=jsonpath='{.status.phase}'=Running pod/sentinel-2 --timeout=300s
    kubectl wait -n gic-wesago --for=jsonpath='{.status.phase}'=Running pod/postgres-0 --timeout=300s
    kubectl wait -n gic-wesago --for=jsonpath='{.status.phase}'=Running pod/postgres-1 --timeout=300s
    kubectl wait -n gic-wesago --for=jsonpath='{.status.phase}'=Running pod/postgres-2 --timeout=300s

    echo "storage.yaml"
    kubectl apply -f storage.yaml
    sleep 5
    kubectl apply -f secret.yaml
    kubectl apply -f configmap.yaml

    kubectl apply -f setup-job.yaml
    kubectl wait --for=condition=Complete --timeout=300s job/wesago-setup -n gic-wesago 

    kubectl apply -f deployment.yaml
    kubectl wait --for=condition=available --timeout=600s deployment/wesago-django -n gic-wesago
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
