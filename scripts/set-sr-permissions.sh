#!/bin/sh

if [ "x" == "x$1" ];
then
  export PRJ_ID="jobhunt-442620"
  export REGION="us-central1"
else
  export PRJ_ID="$1"   # TBD check
  export REGION="$2"   # TBD check
fi


gcloud projects add-iam-policy-binding ${PRJ_ID} \
  --member="serviceAccount:poc-account@${PRJ_ID}.iam.gserviceaccount.com" \
  --role="roles/artifactregistry.writer"

gcloud projects add-iam-policy-binding ${PRJ_ID} \
  --member="serviceAccount:poc-account@${PRJ_ID}.iam.gserviceaccount.com" \
  --role="roles/container.developer"
