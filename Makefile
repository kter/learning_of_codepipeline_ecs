# TODO: empty s3 bucket before deletation
# TODO: empty ecr repository before deletation
web-validate:
	aws cloudformation validate-template --template-body file://web_pipeline.yml
web-create:web-validate
	aws cloudformation create-stack --stack-name learning-of-codepipeline-ecs-web --template-body file://web_pipeline.yml --capabilities CAPABILITY_IAM --parameters ParameterKey=Subnets,ParameterValue=subnet-37ac516f ParameterKey=SourceSecurityGroup,ParameterValue=sg-2451e85d
web-update:web-validate
	aws cloudformation update-stack --stack-name learning-of-codepipeline-ecs-web --template-body file://web_pipeline.yml --capabilities CAPABILITY_IAM --parameters ParameterKey=Subnets,ParameterValue=subnet-37ac516f ParameterKey=SourceSecurityGroup,ParameterValue=sg-2451e85d
web-delete:
	aws cloudformation delete-stack --stack-name learning-of-codepipeline-ecs-web

app-validate:
	aws cloudformation validate-template --template-body file://app_pipeline.yml
app-create:app-validate
	aws cloudformation create-stack --stack-name learning-of-codepipeline-ecs-app --template-body file://app_pipeline.yml --capabilities CAPABILITY_IAM --parameters ParameterKey=Subnets,ParameterValue=subnet-37ac516f ParameterKey=SourceSecurityGroup,ParameterValue=sg-2451e85d
app-update:app-validate
	aws cloudformation update-stack --stack-name learning-of-codepipeline-ecs-app --template-body file://app_pipeline.yml --capabilities CAPABILITY_IAM --parameters ParameterKey=Subnets,ParameterValue=subnet-37ac516f ParameterKey=SourceSecurityGroup,ParameterValue=sg-2451e85d
app-delete:
	aws cloudformation delete-stack --stack-name learning-of-codepipeline-ecs-app
