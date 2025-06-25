variable "project" {
  type        = string
  description = "Project name"
}

variable "tags" {
  type = map
  description = "Tags to be added to AWS resources"
}