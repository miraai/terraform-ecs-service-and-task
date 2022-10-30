variable "name" {
  description = "The name of the service"
  type        = string
  default     = ""
}

variable "cluster" {
  description = "ARN of an ECS cluster"
  type        = string
  default     = ""
}

variable "task_definition_arn" {
  description = "The family and revision (family:revision) or full ARN of the task definition that you want to run in your service."
  type        = string
  default     = ""
}

variable "platform_version" {
  description = "The platform version on which to run your service."
  type        = string
  default     = "latest"
}

variable "desired_count" {
  description = "The number of instances of the task definition to place and keep running."
  type        = number
  default     = 1
}

variable "subnets" {
  description = "The subnets associated with the task or service."
  type        = list(string)
}

variable "security_groups" {
  description = "The security groups associated with the task or service."
  type        = list(string)
}

variable "assign_public_ip" {
  description = "Assign a public IP address to the ENI"
  type        = bool
  default     = false
}

variable "tags" {
  description = "A map of tags (key-value pairs) passed to resources."
  type        = map(string)
  default     = {}
}

variable "force_new_deployment" {
  description = "Enable to force a new task deployment of the service. "
  type        = bool
  default     = false
}

variable "load_balancer" {
  description = "List of load balancer target group objects. The lb_target_group_arn is either ALB or NLB target group ARN tasks will register with."
  default     = []
  type = list(
    object({
      lb_target_group_arn = string
      container_name      = string
      container_port      = number
    })
  )
}

variable "service_registries" {
  description = "List of service registry objects as per <https://www.terraform.io/docs/providers/aws/r/ecs_service.html#service_registries-1>."
  default     = []
  type = list(
    object({
      registry_arn   = string
      port           = number
      container_name = string
    })
  )
}

variable "deployment_circuit_breaker" {
  description = "Enable the deployment circuit breaker logic"
  default     = []
  type = list(
    object({
      enable   = bool
      rollback = bool
    })
  )
}

variable "task_family" {
  description = "A unique name for your task definition."
  type        = string
  default     = ""
}

variable "task_cpu" {
  description = "The number of cpu units used by the task."
  type        = number
  default     = 256
}

variable "task_memory" {
  description = "The amount (in MiB) of memory used by the task."
  type        = number
  default     = 512
}

variable "execution_role_arn" {
  description = "The Amazon Resource Name (ARN) of the task execution role that the Amazon ECS container agent and the Docker daemon can assume."
  type        = string
  default     = ""
}

variable "task_role_arn" {
  description = "The ARN of IAM role that allows your Amazon ECS container task to make calls to other AWS services."
  type        = string
  default     = ""
}

variable "container_definitions" {
  description = "A list of valid container definitions provided as a single valid JSON document."
  type        = string
  default     = ""
}

variable "deployment_maximum_percent" {
  description = "Upper limit (as a percentage of the service's desiredCount) of the number of running tasks that can be running in a service during a deployment."
  type        = number
  default     = 200
}

variable "deployment_minimum_healthy_percent" {
  description = "Lower limit (as a percentage of the service's desiredCount) of the number of running tasks that must remain running and healthy in a service during a deployment."
  type        = number
  default     = 100
}

variable "volume_name" {
  description = "Name of the volume to mount"
  type        = string
  default     = "storage"
}

variable "volume_host_path" {
  description = "Host path of the mounted volume"
  type        = string
  default     = ""
}

variable "enable_execute_command" {
  description = "Specifies whether to enable Amazon ECS managed tags for the tasks within the service"
  type        = bool
  default     = false
}

variable "deployment_controller_type" {
  type        = string
  description = "Type of deployment controller. Valid values are `CODE_DEPLOY` and `ECS`"
  default     = "ECS"
}