#!/bin/sh -l

if [ $GITHUB_EVENT_NAME == "release" ]
then
	IMAGE_TAG=$GITHUB_REF
elif [ $GITHUB_EVENT_NAME == "push" ]
	IMAGE_TAG="latest"
fi

IMAGE_NAME="$INPUT_GCR_HOST/$GOOGLE_PROJECT_ID/$REPOSITORY_NAME/$INPUT_IMAGE_NAME:$IMAGE_TAG"
echo $GITHUB_EVENT_NAME
echo $GITHUB_REF
echo $INPUT_IMAGE_NAME
echo $IMAGE_TAG
echo $IMAGE_NAME

echo $GCLOUD_SERVICE_KEY | docker login -u _json_key --password-stdin https://$INPUT_GCR_HOST/
docker build -t $IMAGE_NAME .
docker push $IMAGE_NAME
