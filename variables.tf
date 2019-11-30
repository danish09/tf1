variable "vpc_security_group_ids" {
  description = "A list of security group IDs to associate with"
  type        = list(string)
  default     = null
}

variable "subnet_ids" {
  description = "A list of VPC Subnet IDs to launch in"
  type        = list(string)
  default     = []
}