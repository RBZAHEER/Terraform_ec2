module "dev-infra" {
  source = "./infra-app"
  env = "dev"
  bucket_name = "infra-bucket546"
  ec2_ami_id = "ami-0f88e80871fd81e91" #amazon-linux
  instance_count = 1
  instance_type = "t2.micro"
  hash_key = "studentID"
}

module "prd-infra" {
  source = "./infra-app"
  env = "prd"
  bucket_name = "infra-bucket546-01"
  ec2_ami_id = "ami-0f88e80871fd81e91" #amazon-linux
  instance_count = 2
  instance_type = "t2.micro"
  hash_key = "studentID"
}

module "stg-infra" {
  source = "./infra-app"
  env = "stg"
  bucket_name = "infra-bucket546-02"
  ec2_ami_id = "ami-0f88e80871fd81e91" #amazon-linux
  instance_count = 1
  instance_type = "t2.micro"
  hash_key = "studentID"
}