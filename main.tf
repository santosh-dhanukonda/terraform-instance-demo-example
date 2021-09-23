## arn:aws:iam::074738418643:user/sdhanukonda
provider "aws" {
	region = "us-east-1"
}

resource "aws_instance" "ecs-example" {
	ami = "ami-087c17d1fe0178315"
	instance_type = "t2.micro"
	tags= {
		Name = "terraform-example1"
	}
}

