# TODO: empty s3 bucket before deletation
# TODO: empty ecr repository before deletation
validate:
	aws cloudformation validate-template --template-body file://pipeline.yml
create:validate
	aws cloudformation create-stack --stack-name nradio-recorder --template-body file://pipeline.yml --capabilities CAPABILITY_IAM --parameters ParameterKey=Subnets,ParameterValue=subnet-b23f7ec4 ParameterKey=SourceSecurityGroup,ParameterValue=sg-01a3e566
update:validate
	aws cloudformation update-stack --stack-name nradio-recorder --template-body file://pipeline.yml --capabilities CAPABILITY_IAM
delete:
	aws cloudformation delete-stack --stack-name nradio-recorder
