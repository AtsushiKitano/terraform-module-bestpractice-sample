#!/bin/bash

PLAINTEXT=$1
KEYRING=$2
KEY=$3
LOCATION=$4

echo -n $PLAINTEXT | gcloud kms encrypt --project $(gcloud config get-value core/project) --keyring $KEYRING --key $KEY --location $LOCATION  --plaintext-file - --ciphertext-file - | base64
