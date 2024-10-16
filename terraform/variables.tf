variable "region" {
  description = "The region where the instance is deployed"
  type        = string
  default     = "us-east-1"
}
variable "instance_type" {
  description = "The instance type"
  type        = string
  default     = "t3.micro"
}