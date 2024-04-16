cd ../../website
npm i
npm run build
cd ../website_dep/react

kubectl apply -f pvc.yaml