#!/bin/sh

docker login -u $DOCKER_USER -p $DOCKER_PASSWORD
docker push $DOCKER_ORGANIZATION/$DOCKER_IMAGE
