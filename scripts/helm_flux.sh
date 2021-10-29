#!/bin/bash


clear
SCRIPTPATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
source $SCRIPTPATH/common_function

source $SCRIPTPATH/set_kube_config.sh

echo -e "\n\nCreate sa and cluster role binding for tiller"
echo "------------------"
#kubectl -n kube-system create sa tiller


echo -e "\n\nInstall Flux "
echo "------------------"
helm repo add fluxcd https://charts.fluxcd.io
kubectl apply -f https://raw.githubusercontent.com/fluxcd/helm-operator/master/deploy/crds.yaml
kubectl create namespace flux


helm upgrade -i flux fluxcd/flux \
   --set git.url=git@github.com:black-pebbles/k8s \
   --namespace flux

helm upgrade -i helm-operator fluxcd/helm-operator \
  --set git.ssh.secretName=flux-git-deploy \
  --namespace flux \
  --set helm.versions=v3


sudo snap install fluxctl --classic


echo -e "\n\nCopy the pub key to the repo's deploy keys"
echo "------------------"
fluxctl identity --k8s-fwd-ns flux
