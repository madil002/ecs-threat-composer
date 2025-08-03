variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "vpc_tags" {
  type    = map(string)
  default = {}
}

variable "subnet1_tags" {
  type    = map(string)
  default = {}
}

variable "subnet2_tags" {
  type    = map(string)
  default = {}
}

variable "ecs_cluster_name" {
  type = string
}

variable "ecs_task_family" {
  type = string
}

variable "ecs_task_requires_compatibilities" {
  type    = list(string)
  default = ["FARGATE"]
}

variable "ecs_task_network_mode" {
  type    = string
  default = "awsvpc"
}

variable "ecs_task_cpu" {
  type    = string
  default = "1024"
}

variable "ecs_task_memory" {
  type    = string
  default = "2048"
}

variable "ecs_container_name" {
  type = string
}

variable "ecs_container_image" {
  type = string
}

variable "ecs_container_containerport" {
  type = number
}

variable "ecs_container_hostport" {
  type = number
}

variable "ecs_service_name" {
  type = string
}

variable "ecs_service_desired_count" {
  type    = number
  default = 1
}

variable "ecs_service_launch_type" {
  type    = string
  default = "FARGATE"
}

variable "ecs_lb_container_name" {
  type = string
}

variable "ecs_lb_container_port" {
  type = number
}

variable "task_sg_name" {
  type = string
}

variable "ecs_ingress_from_port" {
  type = number
}

variable "ecs_ingress_to_port" {
  type = number
}

variable "ecs_egress_cidr_blocks" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}

variable "ecs_task_execution_role_name" {
  type    = string
  default = "ecs"
}

variable "domain_name" {
  type = string
}

variable "validation_method" {
  type    = string
  default = "DNS"
}

variable "dns_ttl" {
  type    = number
  default = 60
}

variable "target_group_name" {
  type = string
}

variable "target_group_port" {
  type = number
}

variable "target_group_protocol" {
  type    = string
  default = "HTTP"
}

variable "target_group_tags" {
  type    = map(string)
  default = {}
}

variable "lb_name" {
  type = string
}

variable "internal" {
  type    = bool
  default = false
}

variable "lb_type" {
  type    = string
  default = "application"
}

variable "deletion_protection" {
  type    = bool
  default = true
}

variable "lb_tags" {
  type    = map(string)
  default = {}
}

variable "lb_sg_name" {
  type = string
}
