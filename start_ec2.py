import json
import boto3


region = 'ap-south-1'
instances = ['i-0802afbfbf2ff07ca']
ec2 = boto3.client('ec2', region_name=region)


def lambda_handler(event, context):
    ec2.start_instances(InstanceIds=instances)
    print(f"Starting instances: {str(instances)}")
    
    return {
        'statusCode': 200,
        'body': json.dumps('Success')
    }