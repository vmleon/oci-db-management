output "deploy_id" {
  value = var.deploy_id
}

# output "private_endpoint" {
#   value = oci_database_management_db_management_private_endpoint.private_endpoint
# }

# output "adb" {
#   value     = oci_database_autonomous_database.adb
#   sensitive = true
# }

output "ads" {
  value = data.oci_identity_availability_domains.ads.availability_domains[0].name
}

output "db_system_shapes" {
  value = data.oci_database_db_system_shapes.db_system_shapes.db_system_shapes
}
