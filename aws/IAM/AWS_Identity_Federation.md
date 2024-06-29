 **What is AWS Identity Federation, and how does it work with IAM?**

 ```AWS Identity Federation allows users to access AWS resources using externa. identity providers (IdPs) instead of creating separate AWS IAM users. It works with IAM by integrating external identities through:

Web Identity Federation: Users sign in with providers like Google, Facebook, or Amazon. AWS Security Token Service (STS) is used to obtain temporary AWS credentials after users authenticate with these providers.

SAML 2.0 Federation: Users authenticate through SAML-compliant IdPs (e.g., Microsoft Active Directory Federation Services). The SAML assertion is used to assume an IAM role with predefined permissions in AWS.
```
