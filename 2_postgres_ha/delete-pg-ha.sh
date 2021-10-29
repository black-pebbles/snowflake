#!/bin/bash


echo -e "\n deleting postgres service"
kubectl delete -f postgres-service.yaml

echo -e "\n deleting postgres secrets and configs"
kubectl delete -f postgres-secret.yaml

echo -e "\n deleting postgres deployment"
kubectl delete -f postgres-deployment.yaml

echo -e "\n deleting Persistent Volume Claims"
kubectl delete -f postgres-pv.yaml
