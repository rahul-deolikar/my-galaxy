# Rahul's HTTP Server Lambda Function

This AWS Lambda function creates a small HTTP server that displays a welcome message and saves it to an S3 bucket.

## Features

- 🚀 **HTTP Server**: Responds to HTTP requests with a JSON message
- 💾 **S3 Integration**: Automatically saves messages to S3 bucket
- 🛡️ **Error Handling**: Graceful error handling for S3 operations
- 🔧 **CORS Support**: Includes CORS headers for web applications
- ⚡ **Serverless**: Runs on AWS Lambda for cost-effective scaling

## Message

The function displays: **"Hi, i am rahul and joined Hearflow recently"**

## Architecture

```
Internet → API Gateway → Lambda Function → S3 Bucket
```

## Files

- `lambda_function.py` - Main Lambda function code
- `requirements.txt` - Python dependencies
- `deploy.sh` - Manual deployment script
- `cloudformation-template.yaml` - Infrastructure as Code template
- `deploy-cloudformation.sh` - CloudFormation deployment script
- `test_local.py` - Local testing script
- `README.md` - This documentation

## Quick Deployment with CloudFormation (Recommended)

1. **Prerequisites**: Ensure AWS CLI is configured
   ```bash
   aws configure
   ```

2. **Deploy using CloudFormation**:
   ```bash
   ./deploy-cloudformation.sh
   ```

   This will create:
   - Lambda function
   - S3 bucket
   - API Gateway
   - IAM roles and policies
   - All necessary permissions

3. **Get the API endpoint** (shown in deployment output):
   ```bash
   curl https://your-api-id.execute-api.us-east-1.amazonaws.com/prod/message
   ```

## Manual Deployment

1. **Package the Lambda function**:
   ```bash
   ./deploy.sh
   ```

2. **Follow the AWS CLI commands** shown in the script output to:
   - Create the Lambda function
   - Set up API Gateway
   - Configure permissions

## Local Testing

Run the test script to verify function logic:
```bash
python3 test_local.py
```

This will test:
- ✅ Successful message processing and S3 upload
- ✅ Error handling when S3 operations fail

## Response Format

### Success Response (200)
```json
{
  "message": "Hi, i am rahul and joined Hearflow recently",
  "timestamp": "20250121_123456",
  "s3_file": "rahul_message_20250121_123456.txt",
  "status": "Message saved to S3 successfully"
}
```

### Error Response (500)
```json
{
  "error": "S3 Access Denied",
  "message": "Hi, i am rahul and joined Hearflow recently",
  "status": "Failed to save to S3"
}
```

## Environment Variables

- `S3_BUCKET_NAME` - The S3 bucket name (automatically set by CloudFormation)

## S3 File Format

Files are saved in S3 with the naming convention:
- Format: `rahul_message_YYYYMMDD_HHMMSS.txt`
- Content: Plain text message
- Example: `rahul_message_20250121_123456.txt`

## Permissions Required

The Lambda function needs:
- `s3:PutObject` - To save files to S3
- `s3:PutObjectAcl` - To set object permissions
- `s3:GetObject` - To read objects if needed
- `logs:CreateLogGroup`, `logs:CreateLogStream`, `logs:PutLogEvents` - For CloudWatch logging

## Cost Estimation

- **Lambda**: ~$0.20 per 1M requests + $0.0000166667 per GB-second
- **API Gateway**: ~$3.50 per 1M requests
- **S3**: ~$0.023 per GB storage + $0.0004 per 1K PUT requests
- **CloudWatch Logs**: ~$0.50 per GB ingested

For typical usage (few requests per day), costs will be minimal.

## Cleanup

To remove all resources:
```bash
aws cloudformation delete-stack --stack-name rahul-http-server-stack --region us-east-1
```

## Troubleshooting

### Common Issues

1. **Function not found**: Ensure the Lambda function is deployed
2. **Access denied**: Check IAM permissions
3. **S3 errors**: Verify bucket exists and permissions are correct
4. **API Gateway 502**: Check Lambda function logs in CloudWatch

### Viewing Logs

```bash
aws logs describe-log-groups --log-group-name-prefix "/aws/lambda/rahul-http-server"
aws logs get-log-events --log-group-name "/aws/lambda/rahul-http-server" --log-stream-name "STREAM_NAME"
```

## Development

### Adding Features

1. Modify `lambda_function.py`
2. Test locally with `python3 test_local.py`
3. Deploy using CloudFormation or manual scripts

### Updating Dependencies

1. Update `requirements.txt`
2. Redeploy the function

## Security Notes

- The S3 bucket has public access blocked by default
- API Gateway endpoint is public but can be secured with API keys if needed
- Consider enabling AWS CloudTrail for audit logging

## Support

For issues or questions about this Lambda function, please refer to the AWS documentation or create an issue in the project repository.