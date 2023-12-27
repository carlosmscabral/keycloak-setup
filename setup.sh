#!/bin/bash


source ./env.sh

### Create Static IP Address
# https://cloud.google.com/compute/docs/ip-addresses/reserve-static-external-ip-address#reserve_new_static
### Just for reference - the gateway YAML is hardcoding IP already

gcloud compute addresses create cabral-gke-static-ip \
    --global \
    --project=${PROJECT_ID}


### List Static IP Address

gcloud compute addresses list --project=${PROJECT_ID} 

STATIC_IP=$(gcloud compute addresses list --project=${PROJECT_ID} --filter="name=cabral-gke-static-ip" --format='value(ADDRESS)')


### https://cloud.google.com/kubernetes-engine/docs/how-to/secure-gateway#secure-using-ssl-certificates

### Create SSL Certificate
### Just for refence - the gateway YAML is hardcoding this certificate

gcloud compute ssl-certificates create cabral-gke-static-ip-cert \
    --domains=keycloak.${STATIC_IP}.nip.io \
    --global \
    --project=${PROJECT_ID}


gcloud compute ssl-certificates list --project=${PROJECT_ID} 

gcloud container clusters get-credentials ${CLUSTER_NAME} --region ${CLUSTER_REGION} --project ${PROJECT_ID}

### Just for reference - the gateway YAML is hardcoding this certificate and domain/IP
kubectl apply -f ./gateway.yaml
kubectl apply -f ./keycloak.yaml


### Create