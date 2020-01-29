# PredChem Default Service Building action

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

```ylm
uses: colpal/actions-name
    with: 
    input_one: 
```