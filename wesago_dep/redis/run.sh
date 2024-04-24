kubectl apply -f redis-secret.yaml

kubectl apply -f redis/configmap.yaml
kubectl apply -f redis/statefulset.yaml
kubectl apply -f redis/service.yaml

kubectl wait -n gic-wesago --for=condition=Ready pod/redis-0 --timeout=300s
kubectl wait -n gic-wesago --for=condition=Ready pod/redis-1 --timeout=300s
kubectl wait -n gic-wesago --for=condition=Ready pod/redis-2 --timeout=300s

kubectl apply -f sentinel/statefulset.yaml
kubectl apply -f sentinel/service.yaml