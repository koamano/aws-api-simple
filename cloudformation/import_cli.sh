aws cloudformation create-change-set --stack-name cloudformation-sandbox --change-set-name ImportChangeSet --change-set-type IMPORT --resources-to-import file://sandbox_resources.txt --template-body file://deployment.yaml --parameters file://sandbox_parameters.json --capabilities CAPABILITY_IAM

# aws cloudformation create-change-set --stack-name cloudformation-sandbox --change-set-name ImportChangeSet --change-set-type IMPORT --resources-to-import file://sandbox_resources.txt --template-url https://test-template-koamano.s3.us-east-2.amazonaws.com/deployment.yaml --parameters file://sandbox_parameters.json --capabilities CAPABILITY_IAM

# aws cloudformation describe-change-set --change-set-name ImportChangeSet --stack-name cloudformation-sandbox
# aws cloudformation execute-change-set --change-set-name ImportChangeSet --stack-name cloudformation-sandbox