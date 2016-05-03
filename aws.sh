#!/bin/bash

CMD="docker run \
       --rm \
       --interactive \
       --tty \
       --name aws \
       --net "host" \
       --env AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \
       --env AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
       --env AWS_REGION=$AWS_REGION \
       --user=$(id -u $(whoami)):$(id -g $(whoami)) \
       --volume $HOME:/home/developer \
       --volume $(pwd):/pwd \
       kurron/docker-aws-cli:1.10.24"

#eval echo $CMD $*
eval $CMD $*
