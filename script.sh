#!/bin/bash

echo "Criando a imagem..."

docker build -t akira78/projeto2-k8s:2.0 app/.

echo "Realizando o push da imagem..."

docker push akira78/projeto2-k8s:2.0

echo "Criando o serviço de cluster..."

kubectl apply -f ./services.yml

echo "Realizando os deployments..."

kubectl apply -f ./mysql-deployment.yml --record
kubectl apply -f ./app-deployment.yml --record
