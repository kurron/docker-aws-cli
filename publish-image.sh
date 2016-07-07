#!/bin/bash

if [ "$1" = "" ]
then
 echo "Usage: $0 tag"
 exit
fi

TAG=$1

TAG_COMMAND="docker tag aws-cli:compose kurron/docker-aws-cli:$TAG"
echo $TAG_COMMAND
$TAG_COMMAND

PUSH_COMMAND="docker push kurron/docker-aws-cli:$TAG"
echo $PUSH_COMMAND
$PUSH_COMMAND
