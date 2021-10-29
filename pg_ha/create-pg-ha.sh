#!/bin/bash

echo -e "\n creating Persistent Volume Claims"
kubectl create -f postgres-pv.yaml

echo -e "\n creating postgres secrets and configs"
kubectl create -f postgres-secret.yaml

echo -e "\n creating postgres deployment"
kubectl create -f postgres-deployment.yaml

echo -e "\n creating postgres service"
kubectl create -f postgres-service.yaml
