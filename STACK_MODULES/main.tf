#Module Call
module "CORE-INFO" {
  source="./MODULES/CORE-INFO"
  required_tags={
    Environment=var.Environment,
    OwnerEmail=var.OwnerEmail,
    System=var.system,
    Backup=var.backup,
    Region=var.AWS_REGION
    stack_controls = var.stack_controls
  }
}

module "EC2-BASE" {
  source         = "./MODULES/EC2-BASE"
  ami_id         = data.aws_ami.stack_ami.id
  stack_controls = var.stack_controls
  EC2_Components = var.EC2_Components
  default_vpc_id = var.default_vpc_id
  env            = var.Environment
  subnet_ids     = var.subnet_ids
  project        = var.project
  required_tags  = var.required_tags
  # Environment    = var.environment
  # OwnerEmail     = var.OwnerEmail
  # System         = var.system
  # Backup         = var.backup
  # Region         = var.AWS_REGION
}




