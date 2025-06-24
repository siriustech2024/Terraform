variable "cidr_block" {
  type        = string
  description = "VPC network CIDR"
  default     = "10.0.0.0/16"
}

variable "region" {
  type        = string
  description = "Region for all resources"
  default     = "us-east-1"
}

variable "project" {
  type        = string
  description = "Project name"
}
