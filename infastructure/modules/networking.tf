variable "application_name" {
  type = string
}

variable "environment" {
  type = string
}

#=================================================
#                  VPC
#=================================================

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  tags = {
      Name = "${var.application_name}-vpc-${var.environment}"
      env  = "${var.environment}"
  }
}

#=================================================
#             Security Groups
#=================================================

resource "aws_security_group" "subnets_sg" {
  vpc_id = aws_vpc.main.id
  name   = "${var.application_name}-subnetsg-${var.environment}"
  ingress{
      cidr_blocks = ["10.0.0.0/24"]
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
  }
}

#=================================================
#                  Subnets
#=================================================

resource "aws_subnet" "api_subnet" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.0.0/24"
  tags = {
      Name = "${var.application_name}-apisubnet-${var.environment}"
      env  = "${var.environment}"
  }
}

