#!/usr/bin/env python3

"""
Local test script for the Lambda function
This script simulates the Lambda environment for testing purposes
"""

import json
import os
import sys
from unittest.mock import Mock, patch

# Add the current directory to the path so we can import lambda_function
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

def test_lambda_function():
    """Test the Lambda function locally"""
    
    # Mock the S3 client to avoid actual AWS calls
    with patch('boto3.client') as mock_boto3:
        # Setup mock S3 client
        mock_s3 = Mock()
        mock_boto3.return_value = mock_s3
        
        # Mock successful S3 put_object
        mock_s3.put_object.return_value = {'ETag': '"mock-etag"'}
        
        # Set environment variable
        os.environ['S3_BUCKET_NAME'] = 'test-bucket'
        
        # Import the Lambda function
        from lambda_function import lambda_handler
        
        # Create mock event and context
        event = {
            'httpMethod': 'GET',
            'path': '/message',
            'headers': {
                'Content-Type': 'application/json'
            }
        }
        
        context = Mock()
        context.function_name = 'test-function'
        context.function_version = '1'
        context.aws_request_id = 'test-request-id'
        
        # Call the Lambda function
        response = lambda_handler(event, context)
        
        # Print the response
        print("Lambda Function Test Results:")
        print("=" * 40)
        print(f"Status Code: {response['statusCode']}")
        print(f"Headers: {json.dumps(response['headers'], indent=2)}")
        print(f"Body: {json.dumps(json.loads(response['body']), indent=2)}")
        
        # Verify S3 put_object was called
        assert mock_s3.put_object.called, "S3 put_object should have been called"
        
        # Check the call arguments
        call_args = mock_s3.put_object.call_args
        print("\nS3 put_object call details:")
        print(f"Bucket: {call_args[1]['Bucket']}")
        print(f"Key: {call_args[1]['Key']}")
        print(f"Body: {call_args[1]['Body']}")
        print(f"ContentType: {call_args[1]['ContentType']}")
        
        print("\n✅ Test completed successfully!")
        return response

def test_lambda_function_with_s3_error():
    """Test the Lambda function with S3 error"""
    
    # Mock the S3 client to simulate an error
    with patch('boto3.client') as mock_boto3:
        # Setup mock S3 client
        mock_s3 = Mock()
        mock_boto3.return_value = mock_s3
        
        # Mock S3 error
        mock_s3.put_object.side_effect = Exception("S3 Access Denied")
        
        # Set environment variable
        os.environ['S3_BUCKET_NAME'] = 'test-bucket'
        
        # Import the Lambda function
        from lambda_function import lambda_handler
        
        # Create mock event and context
        event = {
            'httpMethod': 'GET',
            'path': '/message'
        }
        
        context = Mock()
        
        # Call the Lambda function
        response = lambda_handler(event, context)
        
        print("\nError Handling Test Results:")
        print("=" * 40)
        print(f"Status Code: {response['statusCode']}")
        print(f"Body: {json.dumps(json.loads(response['body']), indent=2)}")
        
        assert response['statusCode'] == 500, "Should return 500 on S3 error"
        print("\n✅ Error handling test completed successfully!")
        return response

if __name__ == "__main__":
    print("Testing Rahul's HTTP Server Lambda Function")
    print("=" * 50)
    
    # Test successful case
    test_lambda_function()
    
    # Test error case
    test_lambda_function_with_s3_error()
    
    print("\n🎉 All tests passed!")