variable "target_group_name" {
  type = string
}

variable "target_group_port" {
  type = number
}

variable "target_group_protocol" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "health_check_protocol" {
  type    = string
  default = "HTTP"
}

variable "health_check_path" {
  type    = string
  default = "/"
}

variable "health_check_healthy_threshold" {
  type    = number
  default = 5
}

variable "health_check_unhealthy_threshold" {
  type    = number
  default = 2
}

variable "health_check_timeout" {
  type    = number
  default = 5
}

variable "health_check_interval" {
  type    = number
  default = 30
}

variable "health_check_matcher" {
  type    = string
  default = "200"
}

variable "target_group_tags" {
  type    = map(string)
  default = {}
}

variable "lb_name" {
  type = string
}

variable "internal" {
  type = bool
}

variable "load_balancer_type" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "deletion_protection" {
  type = bool
}

variable "lb_tags" {
  type    = map(string)
  default = {}
}

variable "certificate_arn" {
  type = string
}

variable "sg_name" {
  type = string
}

variable "ingress_cidr_blocks" {
  type    = string
  default = "0.0.0.0/0"
}

variable "egress_cidr_blocks" {
  type    = string
  default = "0.0.0.0/0"
}
