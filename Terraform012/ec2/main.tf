provider "aws" {
    region = "us-east-1"
}

resource "aws_vpc" "my_vpc" {
    # Going to import from AWS
}

resource "aws_security_group" "launch-wizard" {
    # Going to import from AWS
    ingress {
        cidr_blocks = ["0.0.0.0/0"]
        from_port = 22
        protocol = "tcp"
        to_port = 22
    }
}

resource "aws_instance" "jenkins" {
    ami           = "ami-0cd59ecaf368e5ccf"
    instance_type = "t2.micro"
    tags = {
        Name = "Jenkins"
    }
}

resource "aws_eip" "lb" {
    instance = aws_instance.jenkins.id
}

output "ip_addr" {
    value = aws_eip.lb.public_ip
}
