## arn:aws:iam::074738418643:user/sdhanukonda
provider "aws" {
	region = "us-east-1"
}

resource "aws_instance" "ec2-demo-example" {
	ami = "ami-087c17d1fe0178315"
	instance_type = "t2.micro"
	vpc_security_group_ids = [aws_security_group.webserver_security_group.id]
	user_data = <<-EOF
				#!/bin/bash
				echo "Hello Santosh" > index.html
				nohup busybox httpd -f -p 8080 &
				EOF
	tags= {
		Name = "demo-examples"
	}
}

resource "aws_security_group" "webserver_security_group" {
	name = "Web servers Group"
	description = "Host all of the HTTP Webservers"
	ingress  {
	      from_port        = 8080
	      to_port          = 8080
	      protocol         = "tcp"
	      cidr_blocks      = ["0.0.0.0/0"]
	    }
  	
  	tags = {
		Name = "demo-examples"
	}
}