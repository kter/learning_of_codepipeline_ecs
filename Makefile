validate:
	aws cloudformation validate-template --template-body file://pipeline.yml
create-stack:validate
	aws cloudformation create-stack --stack-name test --template-body file://pipeline.yml --capabilities CAPABILITY_IAM
update-stack:validate
	aws cloudformation update-stack --stack-name test --template-body file://pipeline.yml --capabilities CAPABILITY_IAM
