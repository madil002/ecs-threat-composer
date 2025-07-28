variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "vpc_tags" {
  type    = map(string)
  default = {}
}

variable "route_table_cidr" {
  type    = string
  default = "0.0.0.0/0"
}

variable "subnet1_cidr" {
  type    = string
  default = "10.0.1.0/24"
}

variable "subnet2_cidr" {
  type    = string
  default = "10.0.2.0/24"
}

variable "subnet1_availability_zone" {
  type    = string
  default = "eu-west-2a"
}

variable "subnet2_availability_zone" {
  type    = string
  default = "eu-west-2b"
}

variable "subnet1_tags" {
  type    = map(string)
  default = {}
}

variable "subnet2_tags" {
  type    = map(string)
  default = {}
}
