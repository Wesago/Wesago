#!/bin/bash

function apply {

    kubectl apply -f configmap.yaml
    kubectl apply -f statefulset.yaml
    kubectl apply -f service.yaml
}

function delete {
    kubectl delete -f .
    kubectl delete pvc -n gic-wesago data-redis-0
    kubectl delete pvc -n gic-wesago data-redis-1
    kubectl delete pvc -n gic-wesago data-redis-2
    kubectl delete pvc -n gic-wesago rsyslog-logs-redis-0
    kubectl delete pvc -n gic-wesago rsyslog-logs-redis-1
    kubectl delete pvc -n gic-wesago rsyslog-logs-redis-2
}

if [ "$1" == "apply" ]; then
    apply
elif [ "$1" == "delete" ]; then
    delete
else
    echo "Invalid argument. Please provide 'apply' or 'delete'."
fi
