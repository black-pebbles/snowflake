#!/bin/bash

SCRIPTPATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
source $SCRIPTPATH/common_function


echo -e "\nenable required services"
gcloud services enable compute.googleapis.com
gcloud services enable servicenetworking.googleapis.com
gcloud services enable cloudresourcemanager.googleapis.com
gcloud services enable container.googleapis.com


echo -e "\ncreate service account"
gcloud iam service-accounts create $service_account_name


echo -e "\ngrant policy ..."
gcloud projects add-iam-policy-binding ${project_name} --member serviceAccount:${service_account_name}@${project_name}.iam.gserviceaccount.com --role roles/container.admin

gcloud projects add-iam-policy-binding ${project_name} --member serviceAccount:${service_account_name}@${project_name}.iam.gserviceaccount.com --role roles/compute.admin

gcloud projects add-iam-policy-binding ${project_name} --member serviceAccount:${service_account_name}@${project_name}.iam.gserviceaccount.com --role roles/iam.serviceAccountUser

gcloud projects add-iam-policy-binding ${project_name} --member serviceAccount:${service_account_name}@${project_name}.iam.gserviceaccount.com --role roles/iam.serviceAccountAdmin

gcloud projects add-iam-policy-binding ${project_name} --member serviceAccount:${service_account_name}@${project_name}.iam.gserviceaccount.com --role roles/resourcemanager.projectIamAdmin


echo -e "\ngenerate keyfile ..."
gcloud iam service-accounts keys create ${keyfile} --iam-account=${service_account_name}@${project_name}.iam.gserviceaccount.com
