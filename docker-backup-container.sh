#!/usr/bin/env bash

# this is to backup docker container

if [ -z "$1" ]
  then
    echo "Usage: $0  [container-name]"
    exit;
fi

CONTAINER_ID="$1"

REPOSITORY="ctcbk/$CONTAINER_ID"
CONTAINER_TAG="`date +"%a"`"
CONTAINER=$REPOSITORY:$CONTAINER_TAG
BACKUP_DIR=/tmp

echo "creating image from container:$CONTAINER_ID......"
docker rmi $CONTAINER
docker commit -p  $CONTAINER_ID  $CONTAINER

echo "saving image to tar file.. "
docker save -o $BACKUP_DIR/$CONTAINER_ID.tar $CONTAINER

echo "docker images | grep "$CONTAINER_TAG""
docker images | grep "$CONTAINER_TAG"
