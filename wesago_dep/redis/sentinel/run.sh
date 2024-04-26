#!/bin/bash

function apply {

    kubectl wait -n gic-wesago --for=condition=Ready pod/redis-0 --timeout=300s
    kubectl wait -n gic-wesago --for=condition=Ready pod/redis-1 --timeout=300s
    kubectl wait -n gic-wesago --for=condition=Ready pod/redis-2 --timeout=300s

    kubectl apply -f statefulset.yaml
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
