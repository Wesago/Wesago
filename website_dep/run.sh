cd nginx
bash run.sh
cd ..

cd react
bash run.sh
cd ..

# ingress
kubectl apply -f ingress.yaml