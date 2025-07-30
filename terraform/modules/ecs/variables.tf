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
  default = "256"
}

variable "ecs_task_memory" {
  type    = string
  default = "512"
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

variable "ecs_service_assign_public_ip" {
  type    = bool
  default = false
}

variable "ecs_service_subnet_ids" {
  type = list(string)
}

variable "ecs_lb_target_group_arn" {
  type = string
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

variable "vpc_id" {
  type = string
}

variable "ecs_ingress_from_port" {
  type = number
}

variable "ecs_ingress_to_port" {
  type = number
}

variable "ecs_ingress_sg_ids" {
  type = list(string)
}

variable "ecs_egress_cidr_blocks" {
  type = list(string)
}

variable "ecs_task_execution_role_name" {
  type = string
}
