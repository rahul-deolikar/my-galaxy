**Explain the differences between identity base policies and resource-based policies in AWS.**

***Identity-Based Policies:***

**Attached to Identities:** These policies are attached to IAM users, groups, or roles.

**Permission Management:** They define what actions the identity can perform on specified AWS resources.

**Use Case:** Commonly used to manage permissions for individual users or groups within an account.

**Example:** Allowing a user to read from an S3 bucket.

Copy code
```
{
  "Version": "2012-10-17",
  "Statement": {
    "Effect": "Allow",
    "Action": "s3:GetObject",
    "Resource": "arn:aws:s3:::example-bucket/*"
  }
}

````
***Resource-Based Policies:***

**Attached to Resources:** These policies are directly attached to AWS resources like S3 buckets, SQS queues, or SNS topics.

**Permission Management:** They specify who (which identities) can perform actions on the resource.

**Use Case:** Useful for granting cross-account access to resources.

**Example:** Allowing a user from another AWS account to write to an S3 bucket.

Copy code
```
{
  "Version": "2012-10-17",
  "Statement": {
    "Effect": "Allow",
    "Principal": {
      "AWS": "arn:aws:iam::123456789012:user/ExampleUser"
    },
    "Action": "s3:PutObject",
    "Resource": "arn:aws:s3:::example-bucket/*"
  }
}
```

Summary:
***Identity-Based Policies: Define what actions an identity (user, group, role) can perform on resources.
Resource-Based Policies: Define who (which identities) can perform actions on a resource.***
