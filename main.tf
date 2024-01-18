provider "aws" {
  region = "us-east-1"
}

resource "aws_elastic_beanstalk_application" "flask_app" {
  name        = "Compmast"
  description = "Your Flask App"
}

resource "aws_elastic_beanstalk_environment" "flask_env" {
  name        = "compmast_env"
  application = aws_elastic_beanstalk_application.flask_app.name
  solution_stack_name = "64bit Amazon Linux 2 v5.4.0 running Python 3.8"

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "FLASK_APP"
    value     = "ml:app"
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "FLASK_ENV"
    value     = "production"
  }
}
