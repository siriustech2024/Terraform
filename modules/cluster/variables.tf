variable "project" {
  type        = string
  description = "Project name"
}

variable "tags" {
  type        = map(any)
  description = "Tags to be added to AWS resources"
}

variable "subnet_pub_1a" {
  type        = string
  description = "Subnet to create EKS cluster at AZ 1a"
}

variable "subnet_pub_1b" {
  type        = string
  description = "Subnet to create EKS cluster at AZ 1b"
}