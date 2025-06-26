variable "cidr_block" {
  type        = string
  description = "VPC network CIDR"
}

variable "region" {
  type        = string
  description = "Region for all resources"
}

variable "project" {
  type        = string
  description = "Project name"
}

variable "tags" {
  type        = map(any)
  description = "Tags to be added to AWS resources"
}