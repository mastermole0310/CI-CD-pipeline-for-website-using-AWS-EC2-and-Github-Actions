terraform {
  backend "s3" {
    bucket         = "my-terraform-tfstates"
    key            = "terraform.tfstate"
    region         = "us-east-2"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.74.3"
    }
  }

  required_version = ">= 0.14.9"
}

variable "domain" {
  default = "es2smirnov"
  type = string
}

variable "domain_name" {
  default = "es2smirnov.com"
  type = string
}

variable "record_name" {
  default = "www"
  type = string
}

variable "key_name" {
  default = "aws_key"
  type = string
}

provider "aws" {
  #profile = "default"
  region  = "us-east-2"
}

locals {
  private_key=file("C:/Users/алексей/Desktop/alexs.pem")
}


resource "aws_instance" "main_server" {
  ami                    = "ami-0eea504f45ef7a8f7"
  availability_zone = "us-east-2c"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.mywebserver.id]

    connection {
      type     = "ssh"
      user     = "ubuntu"
      host = self.public_ip
      private_key = local.private_key
    } 

     user_data = file("userdata.sh")

  key_name = "alexs"
  tags = {
    Name = "main_server"
  }
}


resource "aws_default_vpc" "default" {
  tags = {
    name = "Default_VPC"
  }
}

resource "aws_security_group" "mywebserver" {
  name        = "webserver security group"
  description = "Allow all inbound traffic"
  vpc_id = "${aws_default_vpc.default.id}"
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "all"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
    from_port   = 8081
    to_port     = 8081
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

data "aws_subnet_ids" "subnet" {
    vpc_id = "${aws_default_vpc.default.id}"
}

resource "aws_lb_target_group" "my_target_group" {
  health_check {
    interval = 10
    path = "/"
    protocol = "HTTP"
    timeout = 5
    healthy_threshold = 5
    unhealthy_threshold = 2
  }
  
  name = "my-test-tg"
  port = 80
  protocol = "HTTP"
  target_type = "instance"
  vpc_id = "${aws_default_vpc.default.id}"
}

resource "aws_lb" "my_aws_alb" {
  name = "my-aws-alb"
  internal = false
  security_groups = [
  "${aws_security_group.mywebserver.id}",
  ]
  subnets = data.aws_subnet_ids.subnet.ids
  tags = {
    name = "test_alb"
  }
  ip_address_type = "ipv4"
  load_balancer_type = "application"
}

resource "aws_lb_listener" "test_lb_listener" {
  load_balancer_arn = "${aws_lb.my_aws_alb.arn}"
       port = 80
       protocol = "HTTP"
       default_action {
         target_group_arn = aws_lb_target_group.my_target_group.arn
         type = "forward"
       }
}

resource "aws_alb_target_group_attachment" "ec-2_attach" {
  count = length(aws_instance.main_server)
  target_group_arn = "${aws_lb_target_group.my_target_group.arn}"
  target_id = "${aws_instance.main_server.id}"
}


resource "aws_acm_certificate" "my_acm_certificate" {
  domain_name = "liver.com"
  subject_alternative_names = ["*.liver.com"]
  validation_method = "DNS"
  lifecycle {
    create_before_destroy = true
  }
}
data "aws_route53_zone" "private_zone" {
  name = "liver.com"
  private_zone = false

}
resource "aws_route53_record" "my_validation" {
  zone_id = data.aws_route53_zone.private_zone.zone_id
  name = var.record_name
  type = "A"
  
  alias {
    name = aws_lb.my_aws_alb.dns_name
    zone_id = "${aws_lb.my_aws_alb.zone_id}"
    evaluate_target_health = true
  }
}
