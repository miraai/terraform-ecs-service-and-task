<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ecs_service.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_service) | resource |
| [aws_ecs_task_definition.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_task_definition) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_assign_public_ip"></a> [assign\_public\_ip](#input\_assign\_public\_ip) | Assign a public IP address to the ENI | `bool` | `false` | no |
| <a name="input_cluster"></a> [cluster](#input\_cluster) | ARN of an ECS cluster | `string` | `""` | no |
| <a name="input_container_definitions"></a> [container\_definitions](#input\_container\_definitions) | A list of valid container definitions provided as a single valid JSON document. | `string` | `""` | no |
| <a name="input_deployment_circuit_breaker"></a> [deployment\_circuit\_breaker](#input\_deployment\_circuit\_breaker) | Enable the deployment circuit breaker logic | <pre>list(<br>    object({<br>      enable   = bool<br>      rollback = bool<br>    })<br>  )</pre> | `[]` | no |
| <a name="input_deployment_controller_type"></a> [deployment\_controller\_type](#input\_deployment\_controller\_type) | Type of deployment controller. Valid values are `CODE_DEPLOY` and `ECS` | `string` | `"ECS"` | no |
| <a name="input_deployment_maximum_percent"></a> [deployment\_maximum\_percent](#input\_deployment\_maximum\_percent) | Upper limit (as a percentage of the service's desiredCount) of the number of running tasks that can be running in a service during a deployment. | `number` | `200` | no |
| <a name="input_deployment_minimum_healthy_percent"></a> [deployment\_minimum\_healthy\_percent](#input\_deployment\_minimum\_healthy\_percent) | Lower limit (as a percentage of the service's desiredCount) of the number of running tasks that must remain running and healthy in a service during a deployment. | `number` | `100` | no |
| <a name="input_desired_count"></a> [desired\_count](#input\_desired\_count) | The number of instances of the task definition to place and keep running. | `number` | `1` | no |
| <a name="input_enable_execute_command"></a> [enable\_execute\_command](#input\_enable\_execute\_command) | Specifies whether to enable Amazon ECS managed tags for the tasks within the service | `bool` | `false` | no |
| <a name="input_execution_role_arn"></a> [execution\_role\_arn](#input\_execution\_role\_arn) | The Amazon Resource Name (ARN) of the task execution role that the Amazon ECS container agent and the Docker daemon can assume. | `string` | `""` | no |
| <a name="input_force_new_deployment"></a> [force\_new\_deployment](#input\_force\_new\_deployment) | Enable to force a new task deployment of the service. | `bool` | `false` | no |
| <a name="input_load_balancer"></a> [load\_balancer](#input\_load\_balancer) | List of load balancer target group objects. The lb\_target\_group\_arn is either ALB or NLB target group ARN tasks will register with. | <pre>list(<br>    object({<br>      lb_target_group_arn = string<br>      container_name      = string<br>      container_port      = number<br>    })<br>  )</pre> | `[]` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the service | `string` | `""` | no |
| <a name="input_platform_version"></a> [platform\_version](#input\_platform\_version) | The platform version on which to run your service. | `string` | `"latest"` | no |
| <a name="input_security_groups"></a> [security\_groups](#input\_security\_groups) | The security groups associated with the task or service. | `list(string)` | n/a | yes |
| <a name="input_service_registries"></a> [service\_registries](#input\_service\_registries) | List of service registry objects as per <https://www.terraform.io/docs/providers/aws/r/ecs_service.html#service_registries-1>. | <pre>list(<br>    object({<br>      registry_arn   = string<br>      port           = number<br>      container_name = string<br>    })<br>  )</pre> | `[]` | no |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | The subnets associated with the task or service. | `list(string)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags (key-value pairs) passed to resources. | `map(string)` | `{}` | no |
| <a name="input_task_cpu"></a> [task\_cpu](#input\_task\_cpu) | The number of cpu units used by the task. | `number` | `256` | no |
| <a name="input_task_definition_arn"></a> [task\_definition\_arn](#input\_task\_definition\_arn) | The family and revision (family:revision) or full ARN of the task definition that you want to run in your service. | `string` | `""` | no |
| <a name="input_task_family"></a> [task\_family](#input\_task\_family) | A unique name for your task definition. | `string` | `""` | no |
| <a name="input_task_memory"></a> [task\_memory](#input\_task\_memory) | The amount (in MiB) of memory used by the task. | `number` | `512` | no |
| <a name="input_task_role_arn"></a> [task\_role\_arn](#input\_task\_role\_arn) | The ARN of IAM role that allows your Amazon ECS container task to make calls to other AWS services. | `string` | `""` | no |
| <a name="input_volume_host_path"></a> [volume\_host\_path](#input\_volume\_host\_path) | Host path of the mounted volume | `string` | `""` | no |
| <a name="input_volume_name"></a> [volume\_name](#input\_volume\_name) | Name of the volume to mount | `string` | `"storage"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_service_arn"></a> [service\_arn](#output\_service\_arn) | The Amazon Resource Name (ARN) that identifies the service. |
| <a name="output_service_cluster"></a> [service\_cluster](#output\_service\_cluster) | The Amazon Resource Name (ARN) of cluster which the service runs on |
| <a name="output_service_desired_count"></a> [service\_desired\_count](#output\_service\_desired\_count) | Desired count of ECS service |
| <a name="output_service_iam_role"></a> [service\_iam\_role](#output\_service\_iam\_role) | The ARN of IAM role used for ELB. |
| <a name="output_service_name"></a> [service\_name](#output\_service\_name) | The name of the service. |
| <a name="output_task_definition_arn"></a> [task\_definition\_arn](#output\_task\_definition\_arn) | Full ARN of the Task Definition. |
| <a name="output_task_definition_family"></a> [task\_definition\_family](#output\_task\_definition\_family) | The family of the Task Definition. |
| <a name="output_task_definition_revision"></a> [task\_definition\_revision](#output\_task\_definition\_revision) | The revision of the task in a particular family. |
<!-- END_TF_DOCS -->