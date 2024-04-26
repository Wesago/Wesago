#!/bin/bash

function apply {

    # pvc
    kubectl apply -f pvc.yaml
    # job
    kubectl apply -f job.yaml

}

function delete {

    # pvc
    kubectl delete -f pvc.yaml
    # job
    kubectl delete -f job.yaml

}

if [ "$1" == "apply" ]; then
   apply
elif [ "$1" == "delete" ]; then
   delete
else
   echo "Invalid argument. Please provide 'apply' or 'delete'."
fi
