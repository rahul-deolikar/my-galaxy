#!/bin/bash

# CloudFormation deployment script for Rahul HTTP Server
STACK_NAME="rahul-http-server-stack"
TEMPLATE_FILE="cloudformation-template.yaml"
REGION="us-east-1"

echo "Deploying Rahul HTTP Server Lambda with CloudFormation..."

# Check if AWS CLI is configured
if ! aws sts get-caller-identity > /dev/null 2>&1; then
    echo "Error: AWS CLI is not configured. Please run 'aws configure' first."
    exit 1
fi

# Deploy the CloudFormation stack
echo "Creating/updating CloudFormation stack: $STACK_NAME"
aws cloudformation deploy \
    --template-file $TEMPLATE_FILE \
    --stack-name $STACK_NAME \
    --capabilities CAPABILITY_NAMED_IAM \
    --region $REGION \
    --parameter-overrides \
        BucketName=rahul-hearflow-messages-$(date +%s) \
        LambdaFunctionName=rahul-http-server

if [ $? -eq 0 ]; then
    echo "Stack deployment successful!"
    
    # Get the API endpoint
    API_ENDPOINT=$(aws cloudformation describe-stacks \
        --stack-name $STACK_NAME \
        --region $REGION \
        --query 'Stacks[0].Outputs[?OutputKey==`ApiEndpoint`].OutputValue' \
        --output text)
    
    S3_BUCKET=$(aws cloudformation describe-stacks \
        --stack-name $STACK_NAME \
        --region $REGION \
        --query 'Stacks[0].Outputs[?OutputKey==`S3BucketName`].OutputValue' \
        --output text)
    
    echo ""
    echo "=== Deployment Complete ==="
    echo "API Endpoint: $API_ENDPOINT"
    echo "S3 Bucket: $S3_BUCKET"
    echo ""
    echo "Test your endpoint:"
    echo "curl $API_ENDPOINT"
    echo ""
    echo "To delete the stack:"
    echo "aws cloudformation delete-stack --stack-name $STACK_NAME --region $REGION"
else
    echo "Stack deployment failed!"
    exit 1
fi