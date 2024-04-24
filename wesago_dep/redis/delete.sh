kubectl delete -f sentinel/service.yaml
kubectl delete -f sentinel/statefulset.yaml

kubectl delete -f redis/service.yaml
kubectl delete -f redis/statefulset.yaml
kubectl delete -f redis/configmap.yaml

kubectl delete -f redis-secret.yaml

kubectl delete pvc -n gic-wesago data-redis-0
kubectl delete pvc -n gic-wesago data-redis-1
kubectl delete pvc -n gic-wesago data-redis-2
kubectl delete pvc -n gic-wesago data-sentinel-0
kubectl delete pvc -n gic-wesago data-sentinel-1
kubectl delete pvc -n gic-wesago data-sentinel-2
