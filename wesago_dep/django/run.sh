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
    kubectl autoscale deployment wesago-django --namespace=gic-wesago --cpu-percent=70 --min=2 --max=5 
    kubectl wait --for=condition=available --timeout=600s deployment/wesago-django -n gic-wesago
    kubectl apply -f service.yaml
}

function delete {
    kubectl delete -f .
    kubectl patch pvc wesago-avatargallery-pvc -n gic-wesago -p '{"metadata":{"finalizers":null}}'
    kubectl patch pvc wesago-media-pvc -n gic-wesago -p '{"metadata":{"finalizers":null}}'
    kubectl patch pvc wesago-static-pvc -n gic-wesago -p '{"metadata":{"finalizers":null}}'
    kubectl patch pvc wesago-theme-pvc -n gic-wesago -p '{"metadata":{"finalizers":null}}'


}

if [ "$1" == "apply" ]; then
    apply
elif [ "$1" == "delete" ]; then
    delete
else
    echo "Invalid argument. Please provide 'apply' or 'delete'."
fi
