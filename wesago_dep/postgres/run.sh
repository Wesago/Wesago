kubectl apply -f secret.yaml

kubectl apply -f configmap.yaml
kubectl apply -f statefulset.yaml
kubectl apply -f service.yaml

# Create the replica User
kubectl wait -n gic-wesago --for=condition=Ready pod/postgres-0 --timeout=300s

kubectl exec -n gic-wesago -it postgres-0 -- /bin/bash -c "while ! pg_isready -U postgres; do sleep 1; done"

kubectl exec -n gic-wesago -it postgres-0 -- createuser -U postgres -c 5 --replication replicationUser

kubectl scale statefulset postgres --replicas=3 -n gic-wesago

