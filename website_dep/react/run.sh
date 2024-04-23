# setup
sudo docker build -t registry.deti/gic-wesago/websitejob:v1 .
sudo docker push registry.deti/gic-wesago/websitejob:v1

# pvc
kubectl apply -f pvc.yaml
# job
kubectl apply -f job.yaml