***What is trusted entity in aws***

***Trusted Entity in AWS
A trusted entity in AWS refers to an AWS principal that is allowed to assume an IAM role. The trusted entity is defined in the trust policy of the IAM role. 
The trust policy specifies which principals (users, roles, or services) are allowed to assume the role and under what conditions***

***Components of a Trusted Entity***

**Principal:**

The Principal element in the trust policy specifies the entities that are trusted to assume the role. These can be AWS accounts, IAM users, IAM roles, or AWS services.

**Service Principal:**

A service principal allows AWS services to assume a role. For example, the EC2 service principal (ec2.amazonaws.com) allows EC2 instances to assume the role.

**AWS Account:**

You can specify an entire AWS account as a trusted entity, allowing any IAM user or role within that account to assume the role.

**Example Trust Policy**
example of a trust policy for an IAM role that allows the EC2 service and a specific IAM user to assume the role:

```
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    },
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::123456789012:user/ExampleUser"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}

```

**Use Cases for Trusted Entities**

**Cross-Account Access:**
Allows roles in one AWS account to be assumed by users or roles in another AWS account. This is useful for organizations that have multiple AWS accounts and need to share resources across them.

**Service Access:**
Allows AWS services to assume roles. For example, an EC2 instance can assume a role to access S3 buckets or DynamoDB tables.

**Federation:**
Enables federated users authenticated by an external identity provider to assume a role.

**Delegation:**
Allows delegating permissions to different users or services within the same account.
