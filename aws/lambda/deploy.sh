#!/bin/bash

# Lambda function deployment script
FUNCTION_NAME="rahul-http-server"
REGION="us-east-1"
ROLE_ARN="arn:aws:iam::YOUR_ACCOUNT_ID:role/lambda-execution-role"
S3_BUCKET="your-s3-bucket-name"

echo "Starting Lambda function deployment..."

# Create deployment package
echo "Creating deployment package..."
mkdir -p build
cp lambda_function.py build/
cd build

# Install dependencies
if [ -f "../requirements.txt" ]; then
    pip install -r ../requirements.txt -t .
fi

# Create ZIP package
zip -r ../lambda-deployment.zip .
cd ..

# Clean up build directory
rm -rf build

echo "Deployment package created: lambda-deployment.zip"

# Deploy Lambda function (uncomment and update the following commands after setting up AWS CLI)
echo "To deploy the Lambda function, run the following AWS CLI commands:"
echo ""
echo "# Create the Lambda function:"
echo "aws lambda create-function \\"
echo "    --function-name $FUNCTION_NAME \\"
echo "    --runtime python3.9 \\"
echo "    --role $ROLE_ARN \\"
echo "    --handler lambda_function.lambda_handler \\"
echo "    --zip-file fileb://lambda-deployment.zip \\"
echo "    --environment Variables='{\"S3_BUCKET_NAME\":\"$S3_BUCKET\"}' \\"
echo "    --region $REGION"
echo ""
echo "# Create API Gateway to expose HTTP endpoint:"
echo "aws apigateway create-rest-api --name rahul-api --region $REGION"
echo ""
echo "# Update function code (if function already exists):"
echo "aws lambda update-function-code \\"
echo "    --function-name $FUNCTION_NAME \\"
echo "    --zip-file fileb://lambda-deployment.zip \\"
echo "    --region $REGION"

echo ""
echo "Don't forget to:"
echo "1. Replace YOUR_ACCOUNT_ID with your actual AWS account ID"
echo "2. Create an S3 bucket and update the bucket name"
echo "3. Create an IAM role with Lambda execution permissions and S3 write access"
echo "4. Set up API Gateway to trigger the Lambda function"