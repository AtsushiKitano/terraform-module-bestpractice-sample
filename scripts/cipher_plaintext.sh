#!/bin/bash

PLAINTEXT=$1
KEYRING=$2
KEY=$3
LOCATION=$4

echo -n $1 | gcloud kms encrypt --project $(gcloud config get-value core/project) --keyring $2 --key $3 --location $4  --plaintext-file - --ciphertext-file - | base64
