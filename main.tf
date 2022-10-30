resource "aws_ecs_service" "this" {
  name                               = var.name
  launch_type                        = "FARGATE"
  cluster                            = var.cluster
  task_definition                    = aws_ecs_task_definition.this.family
  platform_version                   = var.platform_version
  desired_count                      = var.desired_count
  force_new_deployment               = var.force_new_deployment
  deployment_maximum_percent         = var.deployment_maximum_percent
  deployment_minimum_healthy_percent = var.deployment_minimum_healthy_percent
  enable_execute_command             = var.enable_execute_command

  network_configuration {
    subnets          = var.subnets
    security_groups  = var.security_groups
    assign_public_ip = var.assign_public_ip
  }

  dynamic "load_balancer" {
    for_each = var.load_balancer
    content {
      target_group_arn = load_balancer.value.lb_target_group_arn
      container_name   = load_balancer.value.container_name
      container_port   = load_balancer.value.container_port
    }
  }

  dynamic "service_registries" {
    for_each = var.service_registries
    content {
      registry_arn   = service_registries.value.registry_arn
      port           = service_registries.value.port
      container_name = service_registries.value.container_name
    }
  }

  deployment_controller {
    type = var.deployment_controller_type
  }

  dynamic "deployment_circuit_breaker" {
    for_each = var.deployment_circuit_breaker
    content {
      enable   = deployment_circuit_breaker.value.enable
      rollback = deployment_circuit_breaker.value.rollback
    }
  }

  lifecycle {
    ignore_changes = [task_definition, desired_count]
  }

  tags = var.tags
}

resource "aws_ecs_task_definition" "this" {
  family                   = var.task_family
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]

  cpu                = var.task_cpu
  memory             = var.task_memory
  execution_role_arn = var.execution_role_arn
  task_role_arn      = var.task_role_arn

  volume {
    name      = var.volume_name
    host_path = var.volume_host_path
  }

  container_definitions = var.container_definitions

  lifecycle {
    ignore_changes = [container_definitions]
  }

  tags = var.tags
}