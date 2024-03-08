variable "vpc_name" {
    type = string
    default = "my_vpc"
}

variable "ssh_port" {
    type = number
    default = 22
}

variable "is_on" {
    default = true 
}

variable "my_list" {
    type = list(string)
    default = ["Value1","Value2"]
}

variable "my_map" {
    type = map
    
    default = {
        Key1 = "Value1"
        Key2 = "Value2"
    }
}

variable "vpc_input" {
    type = string
    description = "Set the name of the vpc"
}

resource "aws_vpc" "my_vpc" {
    cidr_block = "10.0.0.0/16"

    tags = {
        Name = var.vpc_input
    }
}

output "vpc_id" {
    value = aws_vpc.my_vpc.id
}

variable "tuple" {
    type = tuple([string,number,string])
    default = (["name",22,"name2"])
}

variable "object" {
    type = object({name = string,ports = list(number) })
    default = {
        name = "my_vpc"
        ports = [22,25,80]
    }
}
