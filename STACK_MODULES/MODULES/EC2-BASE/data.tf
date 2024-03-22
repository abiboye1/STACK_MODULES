# data "aws_subnets" "stack_sub" {
#   filter {
#     name   = "vpc-id"
#     values = [var.default_vpc_id]
#   }
# }

# data "aws_subnet" "stack_sub" {
#   for_each = toset(data.aws_subnets.stack_sub.ids)
#   id       = each.value
# }

