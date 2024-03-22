locals {
  ServerPrefix = ""
}

### Declare Key Pair
resource "aws_key_pair" "Stack_KP" {
  key_name   = "stackkp"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}

resource "aws_security_group" "stack-sg" {
  vpc_id = var.default_vpc_id
  name        = "${var.project}-DMZ-EC2"
  description = "Stack IT Security Group For CliXX System"

  ingress {
    description      = "Allow SSH inbound traffic"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "Allow HTTP inbound traffic"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  # ingress {
  #   description      = "Allow NFS inbound traffic"
  #   from_port        = 2049
  #   to_port          = 2049
  #   protocol         = "tcp"
  #   cidr_blocks      = ["0.0.0.0/0"]
  # }
  
  # ingress {
  #   description      = "Allow MYSQL/Aurora inbound traffic"
  #   from_port        = 3306
  #   to_port          = 3306
  #   protocol         = "tcp"
  #   cidr_blocks      = ["0.0.0.0/0"]
  # }


  egress {
    description      = "Allow all outbound traffic"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  # tags = merge({Name  = "${local.ServerPrefix != "" ? local.ServerPrefix : "Application_Server_SG_"}${count.index}"}, module.CORE-INFO.all_resource_tags)
}

# resource "aws_security_group_rule" "ssh" {
#   security_group_id = aws_security_group.stack-sg.id
#   type              = "ingress"
#   protocol          = "tcp"
#   from_port         = 22
#   to_port           = 22
#   cidr_blocks       = ["0.0.0.0/0"]
# }


resource "aws_instance" "server" {
  # count                   = var.stack_controls["ec2_create"] == "Y" ? 1 : 0
  ami                     = var.ami_id
  instance_type           = var.EC2_Components["instance_type"]
  vpc_security_group_ids  = [aws_security_group.stack-sg.id]
  user_data               = data.template_file.bootstrap.rendered
  key_name                = aws_key_pair.Stack_KP.key_name
  subnet_id               = var.subnet_ids[0]
 root_block_device {
    volume_type           = var.EC2_Components["volume_type"]
    volume_size           = var.EC2_Components["volume_size"]
    delete_on_termination = var.EC2_Components["delete_on_termination"]
    encrypted             = var.EC2_Components["encrypted"] 
  }
  tags = merge({Name  = "${local.ServerPrefix != "" ? local.ServerPrefix : "Application_Server_Aut"}"}, var.resource_tags)
  # tags = {
  #   Name = "Application-Server"
  # }
} 

# module "CORE-INFO" {
#   source="./MODULES/CORE-INFO"
#   required_tags={
#     Environment=var.Environment,
#     OwnerEmail=var.OwnerEmail,
#     System=var.system,
#     Backup=var.backup,
#     Region=var.AWS_REGION
#     stack_controls = var.stack_controls
#   }
# }


