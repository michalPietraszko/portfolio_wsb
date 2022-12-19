#!/bin/bash

awslocal s3api create-bucket --bucket bktt
awslocal s3api put-bucket-policy --bucket bktt --policy file://bucket_policy.json
awslocal s3 sync ./s3-mock-files s3://bktt/
awslocal s3 website s3://bktt/ --index-document index.html --error-document error.html