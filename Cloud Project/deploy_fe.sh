#!/bin/bash
ROOT_DIR=$(pwd)
FE_DIR="$ROOT_DIR/frontend"
DEPLOY_DIR="$ROOT_DIR/infra/k8s/cloud-computing"
TEMPLATE_DIR="$ROOT_DIR/infra/k8s/cloud-computing/templates"
LATEST_TAG=$1

# Build and push image tag
cd $FE_DIR

PRE_FIX=$(echo "$LATEST_TAG" | awk -F '.' '{print $1 "." $2 "."}')
VERSION=$(echo "$LATEST_TAG" | awk -F '.' '{print $3}')

FE_NEW_TAG=${PRE_FIX}$(( $VERSION + 1 ))

docker build -t public.ecr.aws/y4r3b5d9/cloud-computing/fe:$FE_NEW_TAG .

docker push public.ecr.aws/y4r3b5d9/cloud-computing/fe:$FE_NEW_TAG


# Deploy
gcloud --project elliptical-feat-385302 container clusters get-credentials minh-gke --region europe-west6-a

cat $TEMPLATE_DIR/fe.yaml.tpl | \
    sed "s/\[\[FE_TAG\]\]/$FE_NEW_TAG/g" \
    > $DEPLOY_DIR/fe.yaml

kubectl apply -f $DEPLOY_DIR/fe.yaml

cd $ROOT_DIR