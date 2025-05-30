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



#instance
resource "aws_instance" "my_instance" {
  # count = 2 
  for_each = tomap({
    micro_server1 = "t2.micro"
    micro_server2 = "t2.micro"
  })

  ami = var.ec2_ami_id
  instance_type = each.value
  key_name = aws_key_pair.my_key.key_name
  security_groups =[aws_security_group.my_security.name] 
  user_data = file("nginx.sh")
  tags = {
    Name = each.key
  }
  root_block_device {
    # Added conditional statement like if var.env is "prd" then the volume size would be 20 Gib but if env is dev it should be default set in ec2_volume_size
    volume_size = var.env == "prd" ? 20 : var.ec2_volume_size
    volume_type = var.ec2_volume_type
    tags = {
      Name: "terraform"
    }
  }

}