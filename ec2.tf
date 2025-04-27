#keypair
resource "aws_key_pair" "my_key" {
  key_name = "terra-key-ec2"
  public_key = file("terra-key-ec2.pub")
}

#vpc
resource "aws_default_vpc" "default_vpc" {
  tags = {
    Name = "Default VPC"
  }
}

#securityGroups
resource "aws_security_group" "my_security" {
  name = "allow_tls"
  description = "this is TF generated security group"
  vpc_id = aws_default_vpc.default_vpc.id
   tags = {
     Name = "allow_tls"
   }

   #inbound rules
   ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
    description = "SSH Open"
   }
   ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
    description = "HTTP Open"
   }
   ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
    description = "HTTPS Open"
   }

   #Outbound_Rule

   egress {
    from_port = 0
    to_port = 0
    protocol = "-1" #all
    cidr_blocks = [ "0.0.0.0/0" ]
    description = "all access open outbound"
   }
}

# #ami
# data "aws_ami" "name" {
  
# }

#instance
resource "aws_instance" "my_instance" {
  ami = "ami-0e449927258d45bc4"
  instance_type = "t2.micro"
  key_name = aws_key_pair.my_key.key_name
  security_groups =[aws_security_group.my_security.name] 
  
  root_block_device {
    volume_size = 10
    volume_type = "gp3"
    tags = {
      Name: "Terra_automated"
    }
  }
}