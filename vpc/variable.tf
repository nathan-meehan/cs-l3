variable "vpc_cidr_block" {
  type        = string
  description = "The IPv4 address space assigned to the VPC"
  default     = "10.0.0.0/16"
}

variable "vpc_name" {
  type        = string
  description = "The name of the VPC"
  default     = "new-vpc"

}
