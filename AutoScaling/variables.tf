

variable "ami"{
type=string
default="ami-0a606d8395a538502"
}

variable "instance_type"{
type=string
default="t2.micro"
}

variable "az"{
type=list
default=["us-east-2a","us-east-2b","us-east-2c"]
} 