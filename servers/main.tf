data "aws_ami" "linux2023"{
    filter{
        name = "name"
        values = ["al2023-ami-2023.5.20240916.0-kernel-6.1-x86_64"]
    }
    filter {
        name = "virtualization-type"
        values = ["hvm"]
    }  
    owners = ["137112412989"] 
}

data "aws_security_group" "tp-all-Allow-sg"{
      name = "tp-all-Allow"
}

resource "aws_security_group" "tp_allow_tls" {
  name        = "${data.aws_security_group.tp-all-Allow-sg.name}"
  description = "tp-all-Allow"
  vpc_id = "vpc-0329206d79dcb59b1"
  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = []
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = []
  }

}
#this we are commneting as we dont need it
# resource "aws_network_interface" "tp-nic01" {
#   subnet_id   = var.subnet_id
#   #private_ips = ["172.16.10.100"]

#   tags = {
#     Name = "tp-nic01"
#   }
# }


resource "aws_instance" "tp-jenkins" {
  ami           = data.aws_ami.linux2023.id
  instance_type = "t3.micro"
#    network_interface {
#     network_interface_id = aws_network_interface.tp-nic01.id
#     device_index         = 0
#   }
  user_data  = file("C:\\Users\\DELL\\Downloads\\SukhanthAWSDevOps\\Projects\\TwistProject\\servers\\userscript.sh") 
  associate_public_ip_address = true
  vpc_security_group_ids = ["${aws_security_group.tp_allow_tls.id}"]
  subnet_id = "subnet-016c969faff0f56fb"
}

resource "aws_instance" "tp-monitoring" {
  ami           = data.aws_ami.linux2023.id
  instance_type = "t3.micro"
  associate_public_ip_address = true
  vpc_security_group_ids = ["${aws_security_group.tp_allow_tls.id}"]
  subnet_id = "subnet-016c969faff0f56fb"
}