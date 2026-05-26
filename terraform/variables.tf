variable "aws_region" {
    description = "AWS Region"
    type = string
    default = "us-east-1"
}

variable "instance_type" {
    description = "AWS Instance Type"
    type = string
    default = "t3.micro"
}

variable "key_name" {
    description = "SSH Key Name"
    type = string
}
