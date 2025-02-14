source .envrc

# Create TF State S3 Bucket
aws s3api create-bucket --bucket abme-tf-state --region eu-west-2 --create-bucket-configuration LocationConstraint=eu-west-2
aws s3api put-bucket-versioning --bucket abme-tf-state --versioning-configuration Status=Enabled

# Create TF State Lock DynamoDB Table
aws dynamodb create-table \
    --table-name abme-tf-state-lock \
    --attribute-definitions AttributeName=LockID,AttributeType=S \
    --key-schema AttributeName=LockID,KeyType=HASH \
    --billing-mode PAY_PER_REQUEST \
    --region eu-west-2
