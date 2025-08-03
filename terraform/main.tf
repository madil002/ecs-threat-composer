module "vpc" {
  source       = "./modules/vpc"
  vpc_cidr     = var.vpc_cidr
  vpc_tags     = var.vpc_tags
  subnet1_tags = var.subnet1_tags
  subnet2_tags = var.subnet2_tags
}

module "ecs" {
  source                            = "./modules/ecs"
  ecs_cluster_name                  = var.ecs_cluster_name
  ecs_task_family                   = var.ecs_task_family
  ecs_task_requires_compatibilities = var.ecs_task_requires_compatibilities
  ecs_task_network_mode             = var.ecs_task_network_mode
  ecs_task_cpu                      = var.ecs_task_cpu
  ecs_task_memory                   = var.ecs_task_memory
  ecs_container_name                = var.ecs_container_name
  ecs_container_image               = var.ecs_container_image
  ecs_container_containerport       = var.ecs_container_containerport
  ecs_container_hostport            = var.ecs_container_hostport
  ecs_service_name                  = var.ecs_service_name
  ecs_service_desired_count         = var.ecs_service_desired_count
  ecs_service_launch_type           = var.ecs_service_launch_type
  ecs_service_subnet_ids            = [module.vpc.subnet1_id, module.vpc.subnet2_id]
  ecs_lb_target_group_arn           = module.alb.lb_target_group_arn
  ecs_lb_container_name             = var.ecs_lb_container_name
  ecs_lb_container_port             = var.ecs_lb_container_port
  task_sg_name                      = var.task_sg_name
  vpc_id                            = module.vpc.vpc_id
  ecs_ingress_from_port             = var.ecs_ingress_from_port
  ecs_ingress_to_port               = var.ecs_ingress_to_port
  ecs_ingress_sg_ids                = [module.alb.lb_sg_id]
  ecs_egress_cidr_blocks            = var.ecs_egress_cidr_blocks
  ecs_task_execution_role_name      = var.ecs_task_execution_role_name
}

module "route53" {
  source      = "./modules/route53"
  domain_name = var.domain_name
  lb_dns_name = module.alb.lb_dns_name
  lb_zone_id  = module.alb.lb_zone_id
}

module "acm" {
  source                 = "./modules/acm"
  domain_name            = var.domain_name
  validation_method      = var.validation_method
  route53_domain_zone_id = module.route53.domain_zone_id
  dns_ttl                = var.dns_ttl
}


module "alb" {
  source                = "./modules/alb"
  target_group_name     = var.target_group_name
  target_group_port     = var.target_group_port
  target_group_protocol = var.target_group_protocol
  vpc_id                = module.vpc.vpc_id
  target_group_tags     = var.target_group_tags
  lb_name               = var.lb_name
  internal              = var.internal
  load_balancer_type    = var.lb_type
  subnet_ids            = [module.vpc.subnet1_id, module.vpc.subnet2_id]
  deletion_protection   = var.deletion_protection
  lb_tags               = var.lb_tags
  certificate_arn       = module.acm.cert_arn
  sg_name               = var.lb_sg_name
}
