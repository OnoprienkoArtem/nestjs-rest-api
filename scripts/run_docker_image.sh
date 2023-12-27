#!/bin/bash

DOCKER_USERNAME="artonopriienko"
REPO_NAME="docker-test"
TAG="latest"

cd ../

docker login

docker pull $DOCKER_USERNAME/$REPO_NAME:$TAG

docker run -p 3000:3000 $DOCKER_USERNAME/$REPO_NAME:$TAG
