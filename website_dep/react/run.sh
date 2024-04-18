# setup
cd ../../website
npm i
npm run build
cd ../website_dep/react

# pvc
kubectl apply -f pvc.yaml
# copy folder to pvc
kubectl cp -R ../../website/build gic-wesago/nginx-website:/var/www/static