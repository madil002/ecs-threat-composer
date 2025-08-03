vpc_tags                    = { Name = "Main VPC" }
subnet1_tags                = { Name = "Subnet 1" }
subnet2_tags                = { Name = "Subnet 2" }
ecs_cluster_name            = "white-hart"
ecs_task_family             = "threat-app"
ecs_container_name          = "threat-app"
ecs_container_image         = "418272778807.dkr.ecr.eu-west-2.amazonaws.com/ecs-threat-app:latest"
ecs_container_containerport = 3000
ecs_container_hostport      = 3000
ecs_service_name            = "threat-app"
ecs_lb_container_name       = "threat-app"
ecs_lb_container_port       = 3000
task_sg_name                = "ECS-task-sg"
ecs_ingress_from_port       = 3000
ecs_ingress_to_port         = 3000
domain_name                 = "app.madil.co.uk"
target_group_name           = "ecs-service-tasks"
target_group_port           = 3000
target_group_tags           = { Name = "ecs-service-tasks" }
lb_name                     = "ECS-alb"
deletion_protection         = false
lb_tags                     = { Name = "ECS-alb" }
lb_sg_name                  = "ALB-sg"
