data "twc_configurator" "config" {
  location   = var.location
  preset_type = "standard"
}

data "twc_os" "os" {
  name    = "ubuntu"
  version = "22.04"
}

resource "twc_ssh_key" "key" {
  name = "deploy-key"
  body = var.ssh_public_key
}

resource "twc_server" "server" {
  count = var.instance_count
  name  = "devops-server-${count.index + 1}"  # e.g., devops-server-1, devops-server-2
  os_id = data.twc_os.os.id

  configuration {
    configurator_id = data.twc_configurator.config.id
    cpu             = 1
    ram             = 1024  # 1 GB
    disk            = 15360  # 15 GB (минимальное допустимое)
  }

  ssh_keys_ids = [twc_ssh_key.key.id]
}

# Добавляем IPv4 для каждого сервера
resource "twc_server_ip" "ip0" {
  source_server_id = twc_server.server[0].id
  type             = "ipv4"
  ptr              = "devops-server-1.example.com"  # Опционально
}

resource "twc_server_ip" "ip1" {
  source_server_id = twc_server.server[1].id
  type             = "ipv4"
  ptr              = "devops-server-2.example.com"  # Опционально
}
