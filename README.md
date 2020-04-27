# aws-codebuild-terraform
CI service in AWS CodeBuild using terraform

## Pre requisites

* Ruby
```shell script
brew install ruby
gem install bundler
```

* Terraform cli
```shell script
brew update
brew install terraform
```

* [Create S3 remote state bucket](remote-state/README.md) (only once per remote state)
