#!/bin/bash
ROOT_DIR=$(pwd)
BE_SRC="$ROOT_DIR/backend"
DEPLOY_DIR="$ROOT_DIR/infra/k8s/cloud-computing"
TEMPLATE_DIR="$ROOT_DIR/infra/k8s/cloud-computing/templates"
LATEST_TAG=$1

cd $BE_SRC

PRE_FIX=$(echo "$LATEST_TAG" | awk -F '.' '{print $1 "." $2 "."}')
VERSION=$(echo "$LATEST_TAG" | awk -F '.' '{print $3}')

BE_NEW_TAG=${PRE_FIX}$(( $VERSION + 1 ))

docker build -t public.ecr.aws/y4r3b5d9/cloud-computing/be:$BE_NEW_TAG .

docker push public.ecr.aws/y4r3b5d9/cloud-computing/be:$BE_NEW_TAG

gcloud --project elliptical-feat-385302 container clusters get-credentials minh-gke --region europe-west6-a

cat $TEMPLATE_DIR/be.yaml.tpl | \
    sed "s/\[\[BE_TAG\]\]/$BE_NEW_TAG/g" \
    > $DEPLOY_DIR/be.yaml

kubectl apply -f $DEPLOY_DIR/be.yaml

cd $ROOT_DIR