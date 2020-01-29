#!/bin/bash
# file: run.sh
set -e

# Required vars for service
if [ -z "${DEPLOYMENT_NAME}" ]; then
    echo "DEPLOYMENT_NAME not specified. Exiting."
    exit 1
fi
if [ -z "${DEPLOYMENT_PORT}" ]; then
    echo "DEPLOYMENT_PORT not specified. Exiting."
    exit 1
fi

# required vars for kubectl
if [ -z "${GCP_CREDENTIALS-}" ]; then
    echo "GCP_CREDENTIALS not found. Exiting."
    exit 1
fi
if [ -z "${GCP_PROJECT-}" ]; then
    echo "GCP_PROJECT not found. Exiting."
    exit 1
fi
if [ -z "${GKE_CLUSTER_NAME-}" ]; then
    echo "GKE_CLUSTER_NAME not found. Exiting."
    exit 1
fi

# gcloud setup
echo "$GCP_CREDENTIALS" | base64 -d > /tmp/service_account.json
gcloud auth activate-service-account --key-file=/tmp/service_account.json
gcloud config set project "$GCP_PROJECT"

CZONE=$(gcloud container clusters list --format="get(location)" --filter="name=$GKE_CLUSTER_NAME")
gcloud container clusters get-credentials $GKE_CLUSTER_NAME --zone $CZONE --project $GCP_PROJECT

# build template file
sed -i 's/${temp_name}/'${DEPLOYMENT_NAME}'/g' template.yaml
sed 's/${temp_port}/'${DEPLOYMENT_PORT}'/g' template.yaml > service.yaml

kubectl apply -f ./service.yaml