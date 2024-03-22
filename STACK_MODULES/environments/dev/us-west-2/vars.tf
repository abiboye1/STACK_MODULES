variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "AWS_REGION" {}


variable "Environment" {
  default = "dev"
}

variable "default_vpc_id" {
  default = "vpc-086a665c9abe7ac11"
}

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

variable "instance_type" {
  default = "t2.micro"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "my_key"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "my_key.pub"
}

variable "OwnerEmail" {
  default = "yomioye007@gmail.com"
}

variable "AMIS" {
  type = map(string)
  default = {
    us-east-1 = "ami-stack-1.0"
    us-west-2 = "ami-06b94666"
    eu-west-1 = "ami-844e0bf7"
  }
}

variable "subnet" {
  default = "subnet-0ffd90203c1d3e9fc"
}

variable "subnet_ids" {
  type = list(string)
  default = [ 
    # "subnet-0756609f49e78705c",
    "subnet-097e71a58a4bd504d",
    "subnet-0e11363861b8637b1",
    "subnet-0ffda9f440a4821ec"
    ]
}

variable "stack_controls" {
  type = map(string)
  default = {
    ec2_create  = "Y"
    rds_create  = "Y"
    asg_create  = "Y"
    core_create = "Y"
  }
}

variable "EC2_Components" {
  type = map(string)
  default = {
    volume_type           = "gp2"
    volume_size           = 30
    delete_on_termination = true
    encrypted             = "true"
    instance_type         = "t2.micro"
  }
}

variable "Targ_Grp_Components" {
  type = map(string)
  default = {
    port                   = 80
    protocol               = "HTTP"
    path                   = "/"
    interval               = 30
    timeout                = 5
    healthy_threshold      = 5
    unhealthy_threshold    = 2
  }
}

variable "ASG_Components" {
  type = map(string)
  default = {
    key                       = "Name"
    min_size                  = 1
    max_size                  = 3
    desired_capacity          = 1
    wait_for_capacity_timeout = 0
    propagate_at_launch       = true
    health_check_type         = "EC2"
    health_check_grace_period = 30
  }
}

variable "LT_Components" {
  type = map(string)
  default = {
    instance_type = "t2.micro"
    OwnerEmail    = "yomioye007@gmail.com"

    launch_template_description = "Launch template example"
    create_iam_instance_profile = true
    iam_role_name               = "example-asg"
    iam_role_path               = "/ec2/"
    iam_role_description        = "IAM role example"
    CustomIamRole               = "Yes"
  }
}

variable "project" {
  default = "Stack-Mod"
}

variable "backup" {
  default = "yes"
}

# variable "required_tags" {
#   default = module.CORE-INFO.all_resource_tags
# }

variable "required_tags" {
  type = map(string)
  default = {
    # Environment    = var.environment
    # OwnerEmail     = var.OwnerEmail
    # System         = var.system
    # Backup         = var.backup
    # Region         = var.AWS_REGION
  }
}