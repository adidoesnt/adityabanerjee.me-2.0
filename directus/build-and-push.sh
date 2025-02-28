#!/bin/bash

# Login to ECR
aws ecr get-login-password --region eu-west-2 --profile abme | docker login --username AWS --password-stdin 839459181456.dkr.ecr.eu-west-2.amazonaws.com

# Build the Docker image
docker build -t abme-directus .

# Tag the image
docker tag abme-directus:latest 839459181456.dkr.ecr.eu-west-2.amazonaws.com/abme-directus:latest

# Push the image to ECR
docker push 839459181456.dkr.ecr.eu-west-2.amazonaws.com/abme-directus:latest
