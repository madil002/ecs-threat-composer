resource "aws_ecs_cluster" "main" {
  name = "white-hart"
}

resource "aws_ecs_task_definition" "service" {
  family                   = "service"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = 1024
  memory                   = 2048
  execution_role_arn       = aws_iam_role.ecs_task.arn
  #   task_role_arn            =

  container_definitions = jsonencode([
    {
      name      = "threat-app"
      image     = ""
      essential = true
      portMappings = [
        {
          containerPort = 3000
          hostPort      = 3000
        }
      ]
    }
  ])
}

resource "aws_ecs_service" "threat_app" {
  name            = "threat-app"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.service.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    assign_public_ip = true
    security_groups  = [aws_security_group.task_sg.id]
    subnets          = [aws_subnet.subnet1.id, aws_subnet.subnet2.id]
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.main.arn
    container_name   = "threat-app"
    container_port   = 3000
  }
}

resource "aws_security_group" "task_sg" {
  name   = "ECS-task-sg"
  vpc_id = aws_vpc.main.id

  ingress {
    description     = "Allow HTTP"
    from_port       = 3000
    to_port         = 3000
    protocol        = "tcp"
    security_groups = [aws_security_group.alb_sg.id]
  }

  egress {
    description      = "Allow all outbound"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}
