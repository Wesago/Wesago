docker build -t  registry.deti/gic-wesago/nginxstatic:v1 .
docker push registry.deti/gic-wesago/nginxstatic:v1

kubectl apply -f deployment.yaml
kubectl apply -f service.yaml