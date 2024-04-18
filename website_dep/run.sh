cd react
bash run.sh
cd ..

cd nginx
bash run.sh
cd ..

kubectl apply -f ingress.yaml