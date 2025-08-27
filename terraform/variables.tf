variable "timeweb_token" {
  description = "Timeweb Cloud API token"
  type        = string
  sensitive   = true  # Не выводить в логах
}

variable "ssh_public_key" {
  description = "Public SSH key for server access"
  type        = string
}

variable "instance_count" {
  description = "Number of servers to create"
  type        = number
  default     = 2  # Для load balancer (Задача 3)
}

variable "location" {
  description = "Timeweb Cloud location (e.g., ru-1)"
  type        = string
  default     = "ru-1"
}
