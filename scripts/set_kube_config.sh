#!/bin/bash

SCRIPTPATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
source $SCRIPTPATH/common_function

cluster_name=$(gcloud container clusters list | grep -w $region | awk '{print $1}')

echo -e "\nset kube config for cluster ${cluster_name} in the region ${region}, please check ~/.kube/config"
gcloud container clusters get-credentials ${cluster_name} --region ${region}
