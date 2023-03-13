#!/bin/bash

# Set the AWS region and instance ID
source variables.sh

# Create the Lambda function

# action=start
# action=stop

function_name="my-ec2-$action-function"
echo "Creating Lambda function..."
code_file_name=$action"_ec2"


code_file=$code_file_name.py
zip_path=$code_file_name.zip


zip -r $zip_path $code_file

aws lambda create-function \
    --function-name $function_name \
    --runtime python3.8 \
    --role $role_arn \
    --handler $code_file_name.lambda_handler \
    --zip-file fileb://$zip_path \
    --region $region

# Update the function code
echo "Updating function code..."

zip -r $zip_path $code_file


aws lambda update-function-code \
    --function-name $function_name \
    --zip-file fileb://$zip_path \
    --region $region

# Test the function
echo "Testing function..."
aws lambda invoke \
    --function-name $function_name \
    --payload '' \
    response.json \
    --region $region

