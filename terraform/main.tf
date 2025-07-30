module "vpc" {
  source       = "./modules/vpc"
  vpc_cidr     = "10.0.0.0/16"
  vpc_tags     = { Name = "Main VPC" }
  subnet1_tags = { Name = "Subnet 1" }
  subnet2_tags = { Name = "Subnet 2" }
}

module "ecs" {
  source                            = "./modules/ecs"
  ecs_cluster_name                  = "white-hart"
  ecs_task_family                   = "threat-app"
  ecs_task_requires_compatibilities = ["FARGATE"]
  ecs_task_network_mode             = "awsvpc"
  ecs_task_cpu                      = "1024"
  ecs_task_memory                   = "2048"
  ecs_container_name                = "threat-app"
  ecs_container_image               = "418272778807.dkr.ecr.eu-west-2.amazonaws.com/ecs-threat-app:latest"
  ecs_container_containerport       = 3000
  ecs_container_hostport            = 3000
  ecs_service_name                  = "threat-app"
  ecs_service_desired_count         = 1
  ecs_service_launch_type           = "FARGATE"
  ecs_service_subnet_ids            = [module.vpc.subnet1_id, module.vpc.subnet2_id]
  ecs_lb_target_group_arn           = aws_lb_target_group.main.arn
  ecs_lb_container_name             = "threat-app"
  ecs_lb_container_port             = 3000
  task_sg_name                      = "ECS-task-sg"
  vpc_id                            = module.vpc.vpc_id
  ecs_ingress_from_port             = 3000
  ecs_ingress_to_port               = 3000
  ecs_ingress_sg_ids                = [aws_security_group.alb_sg.id]
  ecs_egress_cidr_blocks            = ["0.0.0.0/0"]
  ecs_task_execution_role_name      = "ecs"
}
