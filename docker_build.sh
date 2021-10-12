#!/usr/bin/env bash
# Arguments by Position
# 1 - Version Tag (example: 1.0.3-master)
# 2 - Dockerfile location
# 3 - Project registry repo name (example: daise)
# 4 - Registry name (default: 711226717742.dkr.ecr.us-east-1.amazonaws.com)
#
# Full Registry string: <registry_name>/<project_repo_name>:<version_tag>

VERSION=${1:-0.0.0}

DOCKERFILE_LOC=${2:-Dockerfile}
PROJECT_NAME=${3:-mln-flutter}
FLUTTER_TAG=${4:-2.5.2}
REGISTRY_NAME=${5:-419737012520.dkr.ecr.us-east-1.amazonaws.com}
DOCKER_BUILD=$REGISTRY_NAME/$PROJECT_NAME:$FLUTTER_TAG
#DOCKER_LATEST=$REGISTRY_NAME/$PROJECT_NAME:latest

echo "Running as"
whoami

#echo "Moving Dockerfile"
#echo $DOCKERFILE_LOC
#cp $DOCKERFILE_LOC Dockerfile

echo "Building and Pushing docker image"
echo $DOCKER_BUILD
docker build -t $DOCKER_BUILD -f $DOCKERFILE_LOC --build-arg FLUTTER_TAG=$FLUTTER_TAG .
echo "Login AWS"
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 419737012520.dkr.ecr.us-east-1.amazonaws.com
docker push $DOCKER_BUILD

#echo "Building and Pushing docker latest"
#echo $DOCKER_LATEST
#docker build -t $DOCKER_LATEST .
#docker push $DOCKER_LATEST

echo "Cleaning local images"
docker rmi $DOCKER_BUILD
#docker rmi $DOCKER_LATEST