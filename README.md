# Configure EC2 start stop based on schedule

Make sure `aws-cli ` is installed and credentials are set.

To test try

`aws ec2 describe-instances`


copy `variables-sample.sh` to `variables.sh`

change the instances array and region in `start_ec2.py` and `stop_ec2.py`
```py
instances = ['i-0802afbfbf2ff07ca']
```


set the variables accordingly


``sh
chmod +x *.sh

./create-role.sh

./create-lambda.sh

./create-cloudwatch-rule.sh

``