#!/bin/bash

# This tags and uploads an image to Docker Hub
DEPLOYNAME=predictkube 
PREDICT_POD=$(kubectl get pods | grep $DEPLOYNAME | cut -f 1 -d ' ')



kubectl delete pods $PREDICT_POD

sleep 7

kubectl delete deploy predictkube -n default
