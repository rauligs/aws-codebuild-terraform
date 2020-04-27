# aws-codebuild-terraform
CI service in AWS CodeBuild using terraform

## Pre requisites

* Ruby
```shell script
brew install rbenv
rbenv install 2.6.6
rbenv global 2.6.6
gem install bundler
```

* Terraform cli
```shell script
brew update
brew install terraform
```

* [Create S3 remote state bucket](remote-state/README.md) (only once per remote state bucket)

* Environment variables
```shell script
export AWS_PROFILE=your_aws_profile_here
export AWS_REGION=aws_region
```

* Install dependencies
```shell script
bundle install
```

## Run kitchen terraform tests
It will automatically perform `converge`, `verify` and `destroy` operations so 
make sure you don't have collisions on resource naming.

```shell script
GITHUB_TOKEN=your_github_token_here bundle exec kitchen test -d always
```

## Manual verification
If something goes wrong and we would like to check what state of our infrastructure 
after applying the plan (useful for manual verification) we can just `converge` leaving 
the infrastructure prior the tests run:

```shell script
GITHUB_TOKEN=your_github_token_here bundle exec kitchen converge
```

Make sure the deployed infrastructure gets destroyed afterwards: 
```shell script
GITHUB_TOKEN=your_github_token_here bundle exec kitchen destroy
```
