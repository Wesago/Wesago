kubectl apply -f ingress.yaml

cd react
bash run.sh
cd ../nginx

cd nginx
bash run.sh
cd ../