# DevOps Тестовое Задание (Timeweb Cloud)

## Описание
IaC с Terraform для Timeweb, Ansible для настройки, load balancer, blue/green, GitHub Actions.

## Инструкции по запуску
1. Клонируй: `git clone https://github.com/your/devops-test-timeweb.git`
2. Terraform: `cd terraform; terraform init; terraform apply -var "timeweb_token=yourtoken"`
3. Ansible: `cd ../ansible; ansible-playbook -i inventory/dynamic.py playbooks/setup.yml`
4. Доступ: Curl на LB IP — увидишь IP серверов.

## Структура
- terraform/: Инфраструктура
- ansible/: Конфигурация
- .github/workflows/: CI/CD