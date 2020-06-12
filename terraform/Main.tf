provider "aws" {
    region     = var.region
}
resource "aws_elastic_beanstalk_application" "light-changer" {
    name        = "light-changer-app"
    description = "Light Changer app"
}

resource "aws_elastic_beanstalk_environment" "light-changer-env" {
    name                = "light-changer-prod"
    application         = "${aws_elastic_beanstalk_application.light-changer.name}"
    # solution_stack_name = "64bit Amazon Linux 2 v0.1.0 running Python 3.7 (BETA)"
    # solution_stack_name = "64bit Amazon Linux 2 v3.0.0 running Python 3.7"
    solution_stack_name = "64bit Amazon Linux 2018.03 v2.9.7 running Python 3.6"

    setting {
        namespace = "aws:autoscaling:launchconfiguration"
        name      = "IamInstanceProfile"
        value     = "aws-elasticbeanstalk-ec2-role"
    }
    setting {
        name      = "EnvironmentVariables"
        namespace = "aws:cloudformation:template:parameter"
        resource  = ""
        value = ""
        # value     = "PYTHONPATH=/var/app/venv/staging-LQM1lest/bin"
    }

}


# resource "aws_iam_instance_profile" "test_profile" {
#   name = "test_profile"
#   role = "${aws_iam_role.role.name}"
# }

# resource "aws_iam_role" "role" {
#   name = "test_role"
#   path = "/"

#   assume_role_policy = <<EOF
# {
#     "Version": "2012-10-17",
#     "Statement": [
#         {
#             "Action": "sts:AssumeRole",
#             "Principal": {
#                "Service": "ec2.amazonaws.com"
#             },
#             "Effect": "Allow",
#             "Sid": ""
#         }
#     ]
# }
# EOF
# }