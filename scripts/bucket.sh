#!/bin/bash

SCRIPTPATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
source $SCRIPTPATH/common_function


echo -e "\ncreating bucket"
gsutil mb -p ${project_name} -c regional -l $region gs://${bucket_name}/


echo -e "\nset versioning on bucket"
gsutil versioning set on gs://${bucket_name}/

echo -e "\ngrant permissions on bucket"
gsutil iam ch serviceAccount:${service_account_name}@${project_name}.iam.gserviceaccount.com:legacyBucketWriter gs://${bucket_name}/
