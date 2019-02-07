# One Ec2 instance in public subnet	
resource "aws_instance" "terraec2" {
  #vpc_id="${aws_vpc.terraVPC.id}"
  ami                    = "ami-5b673c34"
  instance_type          = "t2.micro"
  subnet_id              = "${aws_subnet.terraPub1.id}"
  key_name               = "${var.key_nm}"
  vpc_security_group_ids = ["${aws_security_group.access_http.id}", "${aws_security_group.access_ssh.id}"]

  user_data = <<-EOF
			#!/bin/bash
			yum update -y
			yum install httpd -y
			yum install mysql -y
			echo "My First Terra Infra">/var/www/html/index.html
			systemctl start httpd
			systemctl enable httpd
			yum install -y gcc-c++ make
			curl -sL https://rpm.nodesource.com/setup_6.x | sudo -E bash -
			yum install nodejs
			EOF

  tags {
    Name = "terraEC2"
  }
}