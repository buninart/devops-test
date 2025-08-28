#!/usr/bin/env python3
import json
import subprocess
import os

# Абсолютный путь к директории Terraform
terraform_dir = "/home/laptop/devops-test/terraform"
if not os.path.isdir(terraform_dir):
    raise Exception(f"Terraform directory not found: {terraform_dir}")

# Выполняем terraform output и парсим JSON
result = subprocess.run(['terraform', 'output', '-json'], capture_output=True, text=True, cwd=terraform_dir)
if result.returncode != 0:
    raise Exception(f"Terraform output failed: {result.stderr}")

output = json.loads(result.stdout)

# Извлекаем IPs
ips = output['server_ips']['value']

# Формируем инвентарь с явным ansible_host
inventory = {
    'webservers': {
        'hosts': [f"server{i+1}" for i in range(len(ips))],
        'vars': {
            'ansible_user': 'root'
        }
    },
    '_meta': {
        'hostvars': {
            f"server{i+1}": {
                'ansible_host': ip
            } for i, ip in enumerate(ips)
        }
    }
}

print(json.dumps(inventory))
