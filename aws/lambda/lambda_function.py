import json
import boto3
import os
from datetime import datetime

# Initialize S3 client
s3_client = boto3.client('s3')

def lambda_handler(event, context):
    """
    AWS Lambda function that handles HTTP requests and saves messages to S3
    """
    
    # The message to display and save
    message = "Hi, i am rahul and joined Hearflow recently"
    
    # Get S3 bucket name from environment variable
    bucket_name = os.environ.get('S3_BUCKET_NAME', 'your-s3-bucket-name')
    
    try:
        # Save message to S3 bucket
        timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
        file_name = f"rahul_message_{timestamp}.txt"
        
        # Upload the message to S3
        s3_client.put_object(
            Bucket=bucket_name,
            Key=file_name,
            Body=message,
            ContentType='text/plain'
        )
        
        # Return HTTP response
        return {
            'statusCode': 200,
            'headers': {
                'Content-Type': 'application/json',
                'Access-Control-Allow-Origin': '*',
                'Access-Control-Allow-Headers': 'Content-Type',
                'Access-Control-Allow-Methods': 'GET, POST, OPTIONS'
            },
            'body': json.dumps({
                'message': message,
                'timestamp': timestamp,
                's3_file': file_name,
                'status': 'Message saved to S3 successfully'
            })
        }
        
    except Exception as e:
        # Handle errors
        return {
            'statusCode': 500,
            'headers': {
                'Content-Type': 'application/json',
                'Access-Control-Allow-Origin': '*'
            },
            'body': json.dumps({
                'error': str(e),
                'message': message,
                'status': 'Failed to save to S3'
            })
        }