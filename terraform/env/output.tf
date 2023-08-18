output "deploy_id" {
  value = random_string.deploy_id.result
}

output "vault_id" {
  value = oci_kms_vault.vault_db.id
}

output "master_key_id" {
  value = oci_kms_key.master_key_db.id
}

output "publicsubnet_id" {
  value = oci_core_subnet.publicsubnet.id
}

output "privatesubnet_id" {
  value = oci_core_subnet.privatesubnet.id
}
