# setup
sudo docker build -t registry.deti/gic-wesago/nginxwebsite:v1 .
sudo docker push registry.deti/gic-wesago/nginxwebsite:v1

# configmap
kubectl delete configmap nginx-website-conf --namespace=gic-wesago
kubectl create configmap nginx-website-conf --namespace=gic-wesago --from-file=nginx.conf
# deployment
kubectl apply -f deployment.yaml
# service
kubectl apply -f service.yaml
