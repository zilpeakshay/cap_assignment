#!/bin/bash

echo "Creating EKS cluster..."
eksctl create cluster --name devops-cluster --region us-east-1 --nodes 2 --node-type t3.medium --managed

echo "Waiting for nodes..."
kubectl get nodes --watch

echo "Deploying Jenkins..."
kubectl apply -f manifests/jenkins/jenkins-deployment.yaml

echo "Deploying Node.js App (Blue)..."
kubectl apply -f manifests/app/blue-deployment.yaml
kubectl apply -f manifests/app/service.yaml

echo "Deployment complete, can access Jenkins and the app using LoadBalancer IPs."