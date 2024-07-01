----------------------------------------------------------------------------------------------------

**Step 1: Creating my S3 bucket**
The first step you need to take is to create an S3 bucket to put your website’s files and folders.

1. Sign in to the AWS Management Console.
2. Open the Amazon S3 console at https://console.aws.amazon.com/s3/.

---------------------------------------------------------------------------------------------------------

This should display the S3 dashboard.
![image](https://github.com/rahul-deolikar/B-34/assets/171922036/034fc08c-50a1-4c6f-a518-bfb0c7d8e5d6)

3. Click on Create bucket.
---------------------------------------------------------------------------------------------------------------

4. Choose a Region that is geographically close to you to minimize latency and costs, or to address regulatory requirements. The Region that you choose determines your Amazon S3 website endpoint.
![image](https://github.com/rahul-deolikar/B-34/assets/171922036/5bcfaedb-a60c-486a-b7af-84e3c735cb74)

**NOTE: The name of an S3 bucket is unique GLOBALLY but a bucket is always created in the region you specify and never leaves that region until you transfer its objects to another one.**

--------------------------------------------------------------------------------------------------------------

5. Under “Block Public Access settings for this bucket” section, uncheck the “Block all public access” checkbox and accept the acknowledgement.
 ![image](https://github.com/rahul-deolikar/B-34/assets/171922036/41469cf9-c272-4f00-acb8-d29fd39600eb)

-------------------------------------------------------------------------------------------------------------

6. Select “Disable” for Bucket Versioning.
   ![image](https://github.com/rahul-deolikar/B-34/assets/171922036/b893f541-1854-4e37-ad12-acca43abdb3c)
   
-------------------------------------------------------------------------------------------------------------

7. Optional: You can “Add tag” to your bucket for easy identification.
   ![image](https://github.com/rahul-deolikar/B-34/assets/171922036/f7bbcab3-79ee-4966-9ff1-68c32fd51ece)
   
-------------------------------------------------------------------------------------------------------------

8. Under “Default encryption” section, click on disable for Server-side encryption.
![image](https://github.com/rahul-deolikar/B-34/assets/171922036/f54351fa-bf85-4444-8352-150ebd84aefe)
   --------------------------------------------------------------------------------------------

9. Click on “Create bucket”.
   ![image](https://github.com/rahul-deolikar/B-34/assets/171922036/ff1a3cb1-aefb-4a6a-96a4-46b8440de5a1)

You should see the following message and screen.
-------------------------------------------------------------------------------------------------------------
Successfully created bucket “www.rogernem.com"

To upload files and folders, or to configure additional bucket settings, choose View details.
![image](https://github.com/rahul-deolikar/B-34/assets/171922036/52f6c251-1c4f-4494-87a1-e4b794ed59c2)

-------------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------------------
**Step 2: Enabling static website hosting**
-------------------------------------------------------------------------------------------------------------

1. In the Buckets list, choose the name of the bucket that you want to enable static website hosting for (www.rogernem.com).
   ![image](https://github.com/rahul-deolikar/B-34/assets/171922036/534eefe4-09e2-428f-8eed-079346f5808c)

-------------------------------------------------------------------------------------------------------------
2. Click on the “Properties” tab.
   
   ![image](https://github.com/rahul-deolikar/B-34/assets/171922036/89961ce7-3dc5-472e-bae7-d3be7edc7042)

-------------------------------------------------------------------------------------------------------------

3. Scroll down to the “Static website hosting” section and click on its Edit button.

    ![image](https://github.com/rahul-deolikar/B-34/assets/171922036/9f5eb6f7-c471-45ea-a281-daf593d5f4f0)

-------------------------------------------------------------------------------------------------------------

5. Under Static website hosting, choose Enable (1). Also, select Host a static website (2) for the Hosting type. In Index document, enter the file name of the index document, typically index.html(3).
   ![image](https://github.com/rahul-deolikar/B-34/assets/171922036/10007b68-2f12-49ca-bc29-aa6ca9d6098a)

-------------------------------------------------------------------------------------------------------------

6. Click on “Save Changes”. You should see the following next.
   ![image](https://github.com/rahul-deolikar/B-34/assets/171922036/d0fad093-f65a-4c30-acd4-d43af594cca4)

-------------------------------------------------------------------------------------------------------------

***Under Static website hosting, note the Endpoint which is the Amazon S3 website endpoint for your bucket.***
-------------------------------------------------------------------------------------------------------------

**NOTE: After finishing configuring your bucket as a static website, you can use this endpoint to test your website.**
-------------------------------------------------------------------------------------------------------------


-------------------------------------------------------------------------------------------------------------
**Step 3: Securing my S3 bucket through IAM policies**
-------------------------------------------------------------------------------------------------------------

To allow users to access your website and to secure your S3 bucket and block uploads and/or deletions, you will need to add a bucket policy.

1. Under Buckets, click on the name of your website bucket.
![image](https://github.com/rahul-deolikar/B-34/assets/171922036/52bc7da8-c4d4-4c97-b458-491905fb42a5)

-------------------------------------------------------------------------------------------------------------

2. Click on the “Permissions” tab.
   ![image](https://github.com/rahul-deolikar/B-34/assets/171922036/3d5f8779-5164-4314-8c12-50f0149a09ca)

-------------------------------------------------------------------------------------------------------------

3. Under Bucket Policy, choose Edit.
![image](https://github.com/rahul-deolikar/B-34/assets/171922036/9be4a1d6-20db-46c4-91a2-16104e45013b)

-------------------------------------------------------------------------------------------------------------

4. To grant public read access for your website, copy the following bucket policy, and paste it in the Bucket policy editor. Make sure to replace bucket-name with the name of your bucket.

   ``
   {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": [
                "s3:GetObject"
            ],
            "Resource": [
                "arn:aws:s3:::Bucket-Name/*"
            ]
        }
    ]
}
``

--------------------------------------------------------------------------------------------------------------------

|NOTE: The Action “s3:GetObject” with Effect “Allow” let users browse your website.|

![image](https://github.com/rahul-deolikar/B-34/assets/171922036/fb7db69d-e8fb-4508-af09-8b10a7697687)


5. Scroll down and click on “Save changes”. You should see the following next.
![image](https://github.com/rahul-deolikar/B-34/assets/171922036/956f124e-a8a9-4edb-8640-d3297655fb64)

**Step 4: Uploading web files to my S3 bucket**
After completing all the previous steps, you need to upload your website’s files and folders to your website S3 bucket.

1. Under Buckets, click on the name of your website bucket.
![image](https://github.com/rahul-deolikar/B-34/assets/171922036/e1db207a-6332-4d29-8d9d-7bae9592dc21)

-------------------------------------------------------------------------------------------------------------

2. On the Objects tab, you can see that the bucket is currently empty, click on the Upload button.
   ![image](https://github.com/rahul-deolikar/B-34/assets/171922036/ab35761d-f019-4cc7-90e6-e3d3f4be466a)

-------------------------------------------------------------------------------------------------------------
3. This should take you to the Upload page. Click Add files to add the website files and use Add folder to add the website folders.
   ![image](https://github.com/rahul-deolikar/B-34/assets/171922036/8803f765-c514-441c-9091-dfcda1257e9e)
   
-------------------------------------------------------------------------------------------------------------
**Note: The whole website folder shouldn’t be added all at once. Instead, add its content one after the other.**
-------------------------------------------------------------------------------------------------------------

After the necessary files and folders have been added, scroll down and click on Upload. The upload should be done in a few minutes depending on your network and website content size.

**NOTE: Do not close the tab while the upload process is happening.**

**Step 5: Testing my website endpoint**
-------------------------------------------------------------------------------------------------------------

1. Under Buckets, click on the name of your website bucket.
![image](https://github.com/rahul-deolikar/B-34/assets/171922036/5b6b0d18-ba52-46a1-9abe-243af2467d74)

-------------------------------------------------------------------------------------------------------------

2. Click on the “Properties” tab.
![image](https://github.com/rahul-deolikar/B-34/assets/171922036/13227881-ad1b-44fc-95b5-05ddb882f434)

-------------------------------------------------------------------------------------------------------------

3. Scroll down to the “Static website hosting” section and click on your endpoint URL.
   ![image](https://github.com/rahul-deolikar/B-34/assets/171922036/679bb5dd-9dda-4fac-b0d7-f4abc23034be)

-------------------------------------------------------------------------------------------------------------

You should be able to see your website now.
Yay!🎉 Congratulations. That’s it!
![image](https://github.com/rahul-deolikar/B-34/assets/171922036/621641c3-5067-4026-9eae-fdef331550e4)

-------------------------------------------------------------------------------------------------------------
