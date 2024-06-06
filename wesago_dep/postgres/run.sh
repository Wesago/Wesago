#!/bin/bash

function apply {
    kubectl apply -f secret.yaml
    kubectl apply -f configmap.yaml
    kubectl apply -f statefulset.yaml
    kubectl apply -f service.yaml

    # Create the replica User
    kubectl wait -n gic-wesago --for=jsonpath='{.status.phase}'=Running pod/postgres-0 --timeout=300s
    kubectl exec -n gic-wesago -it postgres-0 -- /bin/bash -c "while ! pg_isready -U postgres; do sleep 1; done"
    kubectl exec -n gic-wesago -it postgres-0 -- createuser -U postgres -c 5 --replication replicationUser
    kubectl scale statefulset postgres --replicas=3 -n gic-wesago
    
    # wait for the pods to be ready
    kubectl wait -n gic-wesago --for=jsonpath='{.status.phase}'=Running pod/postgres-1 --timeout=300s
    kubectl wait -n gic-wesago --for=jsonpath='{.status.phase}'=Running pod/postgres-2 --timeout=300s
}

function delete {
    kubectl delete -f .
    kubectl delete pvc -n gic-wesago data-postgres-0
    kubectl delete pvc -n gic-wesago data-postgres-1
    kubectl delete pvc -n gic-wesago data-postgres-2
    kubectl delete pvc -n gic-wesago rsyslog-logs-postgres-0
    kubectl delete pvc -n gic-wesago rsyslog-logs-postgres-1
    kubectl delete pvc -n gic-wesago rsyslog-logs-postgres-2
}

if [ "$1" == "apply" ]; then
    apply
elif [ "$1" == "delete" ]; then
    delete
else
    echo "Invalid argument. Please provide 'apply' or 'delete'."
fi
