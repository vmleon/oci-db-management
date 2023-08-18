
resource "oci_vault_secret" "adb_admin_password" {
  compartment_id = var.compartment_ocid
  secret_content {
    name         = "adb_admin_password_${var.deploy_id}"
    content      = base64encode(random_password.adb_admin_password.result)
    content_type = "BASE64"
    stage        = "CURRENT"
  }
  vault_id = var.vault_id
  key_id   = var.master_key_id

  secret_name = "adb_admin_password_${var.deploy_id}"
  description = "ADB admin password for ${var.deploy_id}"

  depends_on = [random_password.adb_admin_password]
}

resource "oci_vault_secret" "dbcs_password" {
  compartment_id = var.compartment_ocid
  secret_content {
    name         = "dbcs_admin_password_${var.deploy_id}"
    content      = base64encode(random_password.dbcs_admin_password.result)
    content_type = "BASE64"
    stage        = "CURRENT"
  }
  vault_id = var.vault_id
  key_id   = var.master_key_id

  secret_name = "dbcs_admin_password_${var.deploy_id}"
  description = "DBCS Admin password for ${var.deploy_id}"

  depends_on = [random_password.dbcs_admin_password]
}
