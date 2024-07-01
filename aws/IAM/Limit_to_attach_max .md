Limit to attach max no of policies to IAM roles

Maximum number of managed policies that can be attached to an IAM role: MIN. 20 to MAX 2048


***Best Practices***


***To manage this limit effectively:***

***Use Inline Policies Sparingly:*** While there is no limit on the number of inline policies that can be attached to a role, 
it's recommended to use them sparingly for specific use cases where permissions should be tightly coupled to a single role.

***Policy Aggregation:*** Combine permissions into fewer managed policies where possible to stay within the limit. Group related permissions logically.

***Review and Refactor Policies:*** Regularly review policies and refactor them to ensure they are not overly permissive and do not contain redundant permissions.

***Use Policy Variables:*** Use policy variables to make policies more dynamic and reusable. This can help reduce the total number of distinct policies you need to maintain.

