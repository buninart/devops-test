output "server_ips" {
  description = "Public IPv4 addresses of the servers"
  value       = [twc_server_ip.ip0.ip, twc_server_ip.ip1.ip]  # Извлекаем IPv4
}
