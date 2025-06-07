## Overview
This project demonstrates deploying a Node.js app using Blue-Green strategy on an EKS cluster with Jenkins.

## Stack
- EKS (AWS)
- Kubernetes (YAML)
- Jenkins
- Node.js Dummy App
- Docker

## How to Run

1. Clone repo and run setup:
```bash
scripts/setup.sh
```

2. View services:
- Jenkins: `kubectl get svc jenkins`
- App: `kubectl get svc node-service`

3. Blue-Green Switch:
Edit `manifests/app/service.yaml` and change:
```yaml
selector:
  version: green
```
Then run:
```bash
kubectl apply -f manifests/app/service.yaml
```

###IMPORTANT NOTE
If there are many microservices in architecture then optimal way is to go with ingress, here we have used plane load balancer as only single microservice.

## Cleanup
```bash
eksctl delete cluster --name devops-cluster
```