variable "ami_id" {
  default = ""
}

variable "env" {}

variable "default_vpc_id" {}

variable "system" {
  default = "Retail Reporting"
}

variable "subsystem" {
  default = "CliXX"
}

variable "availability_zone" {
  default = "us-east-1c"
}

variable "subnets_cidrs" {
  type = list(string)
  default = [
    "172.31.80.0/20"
  ]
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "my_key"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "my_key.pub"
}


variable "subnet" {
  default = "subnet-0ffd90203c1d3e9fc"
}

variable "subnet_ids" {
  type = list(string)
}

variable "stack_controls" {
  type = map(string)
  default = { }
}

variable "EC2_Components" {
  type = map(string)
  default = {}
}

variable "project" {}

variable "resource_tags" {}