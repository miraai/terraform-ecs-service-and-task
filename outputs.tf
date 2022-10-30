output "service_arn" {
  description = "The Amazon Resource Name (ARN) that identifies the service."
  value       = aws_ecs_service.this.id
}

output "service_name" {
  description = "The name of the service."
  value       = aws_ecs_service.this.name
}

output "service_cluster" {
  description = "The Amazon Resource Name (ARN) of cluster which the service runs on"
  value       = aws_ecs_service.this.cluster
}

output "service_iam_role" {
  description = "The ARN of IAM role used for ELB."
  value       = aws_ecs_service.this.iam_role
}

output "service_desired_count" {
  description = "Desired count of ECS service"
  value       = aws_ecs_service.this.desired_count
}

output "task_definition_family" {
  description = "The family of the Task Definition."
  value       = aws_ecs_task_definition.this.family
}

output "task_definition_arn" {
  description = "Full ARN of the Task Definition."
  value       = aws_ecs_task_definition.this.arn
}

output "task_definition_revision" {
  description = "The revision of the task in a particular family."
  value       = aws_ecs_task_definition.this.revision
}