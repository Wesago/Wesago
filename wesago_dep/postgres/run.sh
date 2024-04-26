#!/bin/bash

function apply {
    kubectl apply -f secret.yaml

    kubectl apply -f configmap.yaml
    kubectl apply -f statefulset.yaml
    kubectl apply -f service.yaml

    # Create the replica User
    kubectl wait -n gic-wesago --for=condition=Ready pod/postgres-0 --timeout=300s

    kubectl exec -n gic-wesago -it postgres-0 -- /bin/bash -c "while ! pg_isready -U postgres; do sleep 1; done"

    kubectl exec -n gic-wesago -it postgres-0 -- createuser -U postgres -c 5 --replication replicationUser

    kubectl scale statefulset postgres --replicas=3 -n gic-wesago
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
