#!/bin/bash

source variables.sh

role_arn=$(aws iam create-role --role-name ec2SchedulerRole --assume-role-policy-document '{
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
        "Service": "lambda.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
' --region "$region" --output text --query 'Role.Arn')


echo ROLE_ARN = $role_arn



aws iam put-role-policy --role-name ec2SchedulerRole --policy-name ec2SchedulerPolicy --policy-document '{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "ec2SchedulerPolicy",
            "Effect": "Allow",
            "Action": [
                "ec2:StartInstances",
                "ec2:StopInstances"
            ],
            "Resource": "arn:aws:ec2:*:*:instance/*"
        }
    ]
}' --region "$region" --output json
