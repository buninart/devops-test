terraform {
  required_providers {
    twc = {
      source  = "tf.timeweb.cloud/timeweb-cloud/timeweb-cloud"
      version = "~> 1.6.5" 
    }
  }
  required_version = ">= 0.13"  # Минимальная версия Terraform
}

provider "twc" {
  token = var.timeweb_token
}

# Комментарий: Для AWS можно добавить provider "aws" с alias и conditional ресурсы,
# но тестируем только Timeweb из-за недоступности AWS в РФ.
