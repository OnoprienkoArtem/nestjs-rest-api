#!/bin/bash

DOCKER_USERNAME="artonopriienko"
REPO_NAME="docker-test"
TAG="latest"

cd ../

docker build -t $DOCKER_USERNAME/$REPO_NAME:$TAG .

docker login
docker push $DOCKER_USERNAME/$REPO_NAME:$TAG

docker logout
