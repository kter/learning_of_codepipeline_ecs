validate:
	aws cloudformation validate-template --template-body file://pipeline.yml
create:validate
	aws cloudformation create-stack --stack-name test --template-body file://pipeline.yml --capabilities CAPABILITY_IAM
update:validate
	aws cloudformation update-stack --stack-name test --template-body file://pipeline.yml --capabilities CAPABILITY_IAM
