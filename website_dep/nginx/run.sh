docker build -t  registry.deti/gic-wesago/nginxstatic:v1 .
docker push registry.deti/gic-wesago/nginxstatic:v1

# configmap
kubectl create configmap nginx-website-conf --namespace=gic-wesago --from-file=nginx.conf
# deployment
kubectl apply -f deployment.yaml
# service
kubectl apply -f service.yaml