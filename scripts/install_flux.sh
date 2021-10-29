#!/bin/bash

SCRIPTPATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
source $SCRIPTPATH/common_function

echo -e "\nInstalling flux in Ubuntu "
echo "--------------------------"
sudo snap install fluxctl --classic

echo -e "\n\nCheck flux version "
echo "-------------------"
fluxctl version

echo -e "\n\nList of nodes "
echo "---------------"
kubectl get nodes


echo -e "\n\nCreate namespace "
echo "------------------"
kubectl create namespace flux


echo -e "\n\nGet namespace ${GHUSER}"
echo "------------------"
fluxctl install \
--git-user=${GHUSER} \
--git-email=${GHUSER}@users.noreply.github.com \
--git-url=git@github.com:${GHUSER}/k8s \
--git-path=namespaces,releases \
--git-branch=master \
--namespace=flux | kubectl apply -f -

echo -e "\n\nCheck the status of deployment"
echo "------------------"
kubectl -n flux rollout status deployment/flux

echo -e "\n\nFetch RSA Key"
echo "------------------"
fluxctl identity --k8s-fwd-ns flux

echo -e "\n\nSync repo"
echo "------------------"
fluxctl sync --k8s-fwd-ns flux
export FLUX_FORWARD_NAMESPACE=flux
