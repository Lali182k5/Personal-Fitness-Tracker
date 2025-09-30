#!/bin/bash

# AWS ECS Deployment Script for Fitness Tracker
# Prerequisites: AWS CLI configured, Docker installed

set -e

# Configuration
AWS_REGION=${AWS_REGION:-us-east-1}
AWS_ACCOUNT_ID=${AWS_ACCOUNT_ID:-"YOUR_ACCOUNT_ID"}
ECR_REPOSITORY="fitness-tracker"
IMAGE_TAG="latest"
CLUSTER_NAME="fitness-tracker-cluster"
SERVICE_NAME="fitness-tracker-service"

echo "🚀 Starting AWS ECS deployment..."

# Step 1: Build and tag Docker image
echo "📦 Building Docker image..."
docker build -t $ECR_REPOSITORY:$IMAGE_TAG .

# Step 2: Create ECR repository if it doesn't exist
echo "📊 Creating ECR repository..."
aws ecr describe-repositories --repository-names $ECR_REPOSITORY --region $AWS_REGION || \
    aws ecr create-repository --repository-name $ECR_REPOSITORY --region $AWS_REGION

# Step 3: Get ECR login token
echo "🔐 Logging into ECR..."
aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com

# Step 4: Tag and push image to ECR
echo "📤 Pushing image to ECR..."
docker tag $ECR_REPOSITORY:$IMAGE_TAG $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$ECR_REPOSITORY:$IMAGE_TAG
docker push $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$ECR_REPOSITORY:$IMAGE_TAG

# Step 5: Update task definition with actual values
echo "📝 Updating task definition..."
sed -i "s/YOUR_ACCOUNT_ID/$AWS_ACCOUNT_ID/g" aws-ecs-task-definition.json
sed -i "s/YOUR_REGION/$AWS_REGION/g" aws-ecs-task-definition.json

# Step 6: Register task definition
echo "📋 Registering task definition..."
aws ecs register-task-definition --cli-input-json file://aws-ecs-task-definition.json --region $AWS_REGION

# Step 7: Create or update ECS service
echo "🚀 Deploying to ECS..."
if aws ecs describe-services --cluster $CLUSTER_NAME --services $SERVICE_NAME --region $AWS_REGION >/dev/null 2>&1; then
    echo "Updating existing service..."
    aws ecs update-service --cluster $CLUSTER_NAME --service $SERVICE_NAME --task-definition fitness-tracker --region $AWS_REGION
else
    echo "Creating new service..."
    aws ecs create-service \
        --cluster $CLUSTER_NAME \
        --service-name $SERVICE_NAME \
        --task-definition fitness-tracker \
        --desired-count 1 \
        --launch-type FARGATE \
        --network-configuration "awsvpcConfiguration={subnets=[YOUR_SUBNET_ID],securityGroups=[YOUR_SECURITY_GROUP_ID],assignPublicIp=ENABLED}" \
        --region $AWS_REGION
fi

echo "✅ Deployment complete! Check AWS ECS console for service status."