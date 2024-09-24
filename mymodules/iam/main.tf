terraform {
  required_version = ">=0.12"
}

resource "aws_iam_role" "aws_eks_role" {
  name = "aws_eks_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_instance_profile" "instance_profile" {
  name = "example_profile"
  role = aws_iam_role.aws_eks_role.name
}

output "aws_eks_role_name" {
   value = aws_iam_role.aws_eks_role.name
}

output "instance_profile" {
   value = aws_iam_instance_profile.instance_profile.name
}