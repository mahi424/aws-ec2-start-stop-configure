region="ap-south-1"
YOUR_ACCOUNT_ID="<YOUR_ACCOUNT_ID>"
role_arn="arn:aws:iam::$YOUR_ACCOUNT_ID:role/ec2SchedulerRole"
action=start
function_name="my-ec2-$action-function"
cron="0 4 * * ? *"
rule_name="my-ec2-$action-rule"