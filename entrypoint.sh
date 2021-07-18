#!/bin/sh -l

IMAGE_NAME="$INPUT_GCR_HOST/$GOOGLE_PROJECT_ID/$REPOSITORY_NAME/$INPUT_IMAGE_NAME:$GITHUB_SHA"
echo $IMAGE_NAME

echo $GCLOUD_SERVICE_KEY | docker login -u _json_key --password-stdin https://$INPUT_GCR_HOST/
docker build -t $IMAGE_NAME .
docker push $IMAGE_NAME
