#!/bin/bash

# This tags and uploads an image to Docker Hub
DOCKERID=useraddmario
DOCKERTAG=predict
DOCKERPATH=$DOCKERID/$DOCKERTAG
DEPLOYNAME=predictkube 
APPPORT=80
FORWARDPORT=8000


# Init a kubernetes deploy with dockerhub image
kubectl create deployment $DEPLOYNAME --image=docker.io/$DOCKERPATH:$DOCKERTAG --port=80


# Grab pod name
predict_pod=$(kubectl get pods | grep $DEPLOYNAME | cut -f 1 -d ' ')


# Wait for predict_pod status to change to Running
status="NotRunning"

while [ "$status" != "Running" ]; do
    status=$(kubectl get pods | grep $DEPLOYNAME | tr -s ' ' | cut -f 3 -d ' ')
done

# Return podname and status
echo "Pod Name:   $predict_pod"
echo "Pod Status: $status"

# Forward the container port to a host
kubectl port-forward pods/$predict_pod $FORWARDPORT:$APPPORT
