
# conditional output
output "linked-service-adf-kv-id" {
  value = var.config.extra-storage ? "extra storage" : null
}