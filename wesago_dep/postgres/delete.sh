kubectl delete -f service.yaml
kubectl delete -f statefulset.yaml
kubectl delete -f configmap.yaml

kubectl delete -f secret.yaml

kubectl delete pvc -n gic-wesago data-postgres-0
kubectl delete pvc -n gic-wesago data-postgres-1
kubectl delete pvc -n gic-wesago data-postgres-2
