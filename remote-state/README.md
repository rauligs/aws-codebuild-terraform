# Create a S3 bucket

**RUN ONLY IF YOU HAVEN'T CREATED ONE YET**

This is a pre requisite to run any other terraform configuration and is
not part of this project main purpose. But kitchen tests won't
work if you don't provision it.

## AWS environment vars

```shell script
export AWS_PROFILE=your_aws_profile_here
export AWS_REGION=eu-west-1
```

## Run

```shell script
terraform init
terraform plan -var "s3_bucket_name=your_bucket_name_here"
terraform apply -var "s3_bucket_name=your_bucket_name_here"
```

_S3 bucket region can be override using `s3_bucket_region` var_