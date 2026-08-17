#!/bin/bash

################################################
# Author: Santhosh Kumar MG
# Date: 14/08/2026
#
# Version: v1
#
# This script will report the AWS resource usage
################################################

# AWS S3 
# AWS EC2
# AWS ambda
# AWS IAM Users

set -x #debug mode

LOG_FILE="/home/ubuntu/resourceTracker"

# AWS S3
echo "Print list of s3" > "$LOG_FILE"
/usr/local/bin/aws s3 ls >> "$LOG_FILE"

# AWS EC2
echo "print list of ec2 instances" >> "$LOG_FILE"
/usr/local/bin/aws ec2 describe-instances | /usr/bin/jq '.Reservations[].Instances[].InstanceId' >> "$LOG_FILE"


# AWS Lambda
echo "print list of lambda function" >> "$LOG_FILE"
/usr/local/bin/aws lambda list-functions >> "$LOG_FILE"

# AWS IAM Users
echo "print list of IAM Users" >> "$LOG_FILE"
/usr/local/bin/aws iam list-users >> "$LOG_FILE"
