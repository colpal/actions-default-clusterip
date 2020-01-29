# Default Service ClusterIP Builder action

Creates and maintains a default ClusterIP service for specified workload

## Inputs

### `deployment_name`

#### Deployment Name

The name of the target workload deployment

### `deployment_port`

#### Deployment Port

The service port of the target workload deployment

### `gcr_service_account`

#### Google Container Registry service account

A credentials file containing for the service account to be used to push to the repository

### `gcr_project`

#### Google Container Registry project

The name of the project which contains the desired repository

### `gke_cluster`

#### Google Kubernetes Engine cluster

The name of the target Kubernetes cluster

### `gke_namespace`

#### Google Kubernetes Engine cluster namespace

The name of the target Kubernetes cluster namespace

## Example usage

```yaml
name: Create default ClusterIP service
on: [push]
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v1
      - uses: colpal/actions-kubectl@v1.0.3
        env:
          GCP_CREDENTIALS: ${{ secrets.GCP_CREDENTIALS }}
          GCP_PROJECT: gcp-project-id
          GKE_CLUSTER_NAME: cluster-name
        with:
          args: version
      - uses: colpal/actions-default-clusterip
        env:
          DEPLOYMENT_NAME: deployment-name
          DEPLOYMENT_PORT: 8080
          GCP_CREDENTIALS: ${{ secrets.GCP_CREDENTIALS }}
          GCP_PROJECT: gcp-project-id
          GKE_CLUSTER: cluster-name
          GKE_NAMESPACE: dev
```