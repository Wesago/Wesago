# configmap
kubectl create configmap nginx-website-conf --namespace=gic-wesago --from-file=nginx.conf
# deployment
kubectl apply -f deployment.yaml
# service
kubectl apply -f service.yaml
