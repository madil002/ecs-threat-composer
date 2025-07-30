resource "aws_ecs_cluster" "main" {
  name = var.ecs_cluster_name
}

resource "aws_ecs_task_definition" "threat_app" {
  family                   = var.ecs_task_family
  requires_compatibilities = var.ecs_task_requires_compatibilities
  network_mode             = var.ecs_task_network_mode
  cpu                      = var.ecs_task_cpu
  memory                   = var.ecs_task_memory
  execution_role_arn       = aws_iam_role.ecs_task.arn

  container_definitions = jsonencode([
    {
      name      = var.ecs_container_name
      image     = var.ecs_container_image
      essential = true
      portMappings = [
        {
          containerPort = var.ecs_container_containerport
          hostPort      = var.ecs_container_hostport
        }
      ]
    }
  ])
}

resource "aws_ecs_service" "threat_app" {
  name            = var.ecs_service_name
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.threat_app.arn
  desired_count   = var.ecs_service_desired_count
  launch_type     = var.ecs_service_launch_type

  network_configuration {
    assign_public_ip = var.ecs_service_assign_public_ip
    security_groups  = [aws_security_group.task_sg.id]
    subnets          = var.ecs_service_subnet_ids
  }

  load_balancer {
    target_group_arn = var.ecs_lb_target_group_arn
    container_name   = var.ecs_lb_container_name
    container_port   = var.ecs_lb_container_port
  }
}

resource "aws_security_group" "task_sg" {
  name   = var.task_sg_name
  vpc_id = var.vpc_id

  ingress {
    from_port       = var.ecs_ingress_from_port
    to_port         = var.ecs_ingress_to_port
    protocol        = "tcp"
    security_groups = var.ecs_ingress_sg_ids
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.ecs_egress_cidr_blocks
  }
}

resource "aws_iam_role" "ecs_task" {
  name = var.ecs_task_execution_role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "ecs_task" {
  role       = aws_iam_role.ecs_task.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}
