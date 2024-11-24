#!/bin/sh

if [ "x" == "x$1" ];
then
  export CLUSTER_NAME="my-gke-cluster"
  export PRJ_ID="jobhunt-442620"
  export REGION="us-central1"
else
  export CLUSTER_NAME="$1"
  export PRJ_ID="$2"   # TBD check
  export REGION="$3"   # TBD check
fi

gcloud container clusters get-credentials $CLUSTER_NAME --region $REGION --project $PRJ_ID
