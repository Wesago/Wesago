cd ../../website
npm i
npm run build
cd ../website_dep/react

kubectl apply -f pvc.yaml
# copy the build folder to the pvc
kubectl cp ../../website/build ?