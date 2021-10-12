#!/usr/bin/env bash
PROJECT_NAME=${1:-mln-flutter}
FLUTTER_TAG=${2:-2.5.2}
REGISTRY_NAME=${3:-419737012520.dkr.ecr.us-east-1.amazonaws.com}
DOCKER_BUILD=$REGISTRY_NAME/$PROJECT_NAME:$FLUTTER_TAG
docker images rm $DOCKER_BUILD
