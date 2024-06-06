#!/bin/bash

function apply {
    kubectl wait -n gic-wesago --for=jsonpath='{.status.phase}'=Running pod/redis-0 --timeout=300s
    kubectl wait -n gic-wesago --for=jsonpath='{.status.phase}'=Running pod/redis-1 --timeout=300s
    kubectl wait -n gic-wesago --for=jsonpath='{.status.phase}'=Running pod/redis-2 --timeout=300s
    kubectl apply -f statefulset.yaml
    kubectl apply -f service.yaml
}

function delete {
    kubectl delete -f .
    kubectl delete pvc -n gic-wesago data-sentinel-0
    kubectl delete pvc -n gic-wesago data-sentinel-1
    kubectl delete pvc -n gic-wesago data-sentinel-2
    kubectl delete pvc -n gic-wesago rsyslog-logs-sentinel-0
    kubectl delete pvc -n gic-wesago rsyslog-logs-sentinel-1
    kubectl delete pvc -n gic-wesago rsyslog-logs-sentinel-2
}

if [ "$1" == "apply" ]; then
    apply
elif [ "$1" == "delete" ]; then
    delete
else
    echo "Invalid argument. Please provide 'apply' or 'delete'."
fi
