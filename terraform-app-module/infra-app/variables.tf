variable "env" {
    description = "Add here environment"
    type = string
}

variable "bucket_name" {
    description = "Bucket_name here"
    type = string
}

variable "ec2_ami_id" {
  description = "ec2_ami_id here"
  type = string
}

variable "instance_count" {
  description = "count here"
  type = number
}

variable "instance_type" {
  description = "instance_type here"
  type = string
}

variable "ec2_volume_type" {
  default = "gp3"
  type = string
}

variable "hash_key" {
  description = "hash_key here"
  type = string
}