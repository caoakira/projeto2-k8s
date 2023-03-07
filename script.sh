#!/bin/bash

echo "Criando as imagem..."

docker build -t caoakira/projeto2-k8s:2.0 app/.

echo "Realizando o push da imagem..."

docker push caoakira/projeto2-k8s:2.0

echo "Criando os serviços do cluster..."

kubectl apply -f ./services.yml

echo "Realizando deployments..."

kubectl apply -f .\mysql-deployment.yml --record
kubectl apply -f .\app-deployment.yml --record
