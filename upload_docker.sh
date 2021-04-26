#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

DOCKERID=useraddmario
DOCKERTAG=predict
IMAGEID=c978f1ae03d8

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create DOCKERPATH
DOCKERPATH=$DOCKERID/$DOCKERTAG

# Step 2:  
# Authenticate & tag
echo "Docker ID and Image: $DOCKERPATH"
docker tag $IMAGEID $DOCKERPATH:$DOCKERTAG

# Step 3:
# Push image to a docker repository
docker push $DOCKERPATH:$DOCKERTAG
