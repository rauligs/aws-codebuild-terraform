require "awspec"

s3_remote_state_bucket_name = attribute("input_s3_remote_state_bucket_name", {})
s3_cicd_bucket_name = attribute("input_cicd_bucket_name", {})
cicd_project_name = attribute("input_cicd_project_name", {})
cicd_iam_role_name = attribute("input_cicd_iam_role_name", {})

describe "The S3 bucket #{s3_remote_state_bucket_name}" do
  subject { s3_bucket(s3_remote_state_bucket_name) }

  it { should exist }
end

describe "The S3 bucket #{s3_cicd_bucket_name}" do
  subject { s3_bucket(s3_cicd_bucket_name) }

  it { should exist }
end

describe "The CI/CD CodeBuild #{cicd_project_name}" do
  subject { codebuild(cicd_project_name) }

  it { should exist }
end

describe "The CI/CD IAM role #{cicd_iam_role_name}" do
  subject { iam_role(cicd_iam_role_name) }

  it { should exist }
  it do
    should have_inline_policy().policy_document(<<-'EOF')
    {
      "Version": "2012-10-17",
      "Statement": [
        {
          "Effect": "Allow",
          "Principal": {
            "Service": "codebuild.amazonaws.com"
          },
          "Action": "sts:AssumeRole"
        }
      ]
    }
    EOF
  end
  it do
    should have_inline_policy().policy_document(<<-'POLICY')
    {
      "Version": "2012-10-17",
      "Statement": [
        {
          "Effect": "Allow",
          "Resource": [
            "*"
          ],
          "Action": [
            "logs:CreateLogGroup",
            "logs:CreateLogStream",
            "logs:PutLogEvents"
          ]
        }
      ]
    }
    POLICY
  end
end