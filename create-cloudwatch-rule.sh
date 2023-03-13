# Create a CloudWatch Events rule to trigger the function

source variables.sh

echo $rule_name $cron $region $YOUR_ACCOUNT_ID $function_name

echo "Creating CloudWatch Events rule..."
aws events put-rule \
    --name $rule_name \
    --schedule-expression "cron($cron)" \
    --region $region

aws events put-targets \
    --rule $rule_name \
    --targets "Id"="1","Arn"="arn:aws:lambda:$region:$YOUR_ACCOUNT_ID:function:$function_name" \
    --region $region

echo "Done."