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

# Create a custom role with the necessary permission artifactregistry.repositories.createOnPush
gcloud iam roles create artifactRegistryPushRole \
    --project $PRJ_ID \
    --title "Artifact Registry Push Role" \
    --permissions artifactregistry.repositories.createOnPush

# Grant the custom role to the service account
gcloud projects add-iam-policy-binding $PRJ_ID \
    --member "serviceAccount:poc-account@${PRJ_ID}.iam.gserviceaccount.com" \
    --role projects/$PRJ_ID/roles/artifactRegistryPushRole
