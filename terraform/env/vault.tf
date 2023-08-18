resource "oci_kms_vault" "vault_db" {
  compartment_id = var.compartment_ocid
  display_name   = "vault_${random_string.deploy_id.result}"
  vault_type     = "DEFAULT" // VIRTUAL_PRIVATE, DEFAULT
}

resource "oci_kms_key" "master_key_db" {
  compartment_id = var.compartment_ocid
  display_name   = "master_key_db_${random_string.deploy_id.result}"
  key_shape {
    algorithm = "AES"
    length    = 32
  }
  management_endpoint = oci_kms_vault.vault_db.management_endpoint
}

