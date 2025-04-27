variable "ec2_ami_id" {
  default = "ami-0e449927258d45bc4"
  type = string
}

variable "ec2_instance_type" {
  default = "t2.micro"
  type = string
}

variable "ec2_volume_size" {
  default = 10
  type = number
}

variable "ec2_volume_type" {
  default = "gp3"
  type = string
}

