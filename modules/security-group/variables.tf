#################
# Security group
#################
variable "vpc_id" {
  description = "ID of the VPC where to create security group"
  type        = string
}

#variable has been defined in the root folder for the SG module
variable "name" {
  description = "Name of security group"
  type        = string
}
