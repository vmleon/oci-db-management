locals {
  dbcs_name     = "dbcs${var.deploy_id}"
  dbcs_domain   = "dbcs${var.deploy_id}"
  dbcs_hostname = "dbcs"
  pdb_name      = "dbcs_pdb"
}

# resource "oci_database_db_system" "db_system" {
#   availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
#   compartment_id      = var.compartment_ocid

#   db_home {
#     database {
#       admin_password = random_password.dbcs_admin_password.result

#       database_id        = oci_database_database.dbcs.id
#       db_domain          = local.dbcs_domain
#       db_name            = local.dbcs_name
#       db_workload        = "OLTP"
#       pdb_name           = local.pdb_name
#       kms_key_id         = var.master_key_id
#       kms_key_version_id = data.oci_kms_key_versions.master_key_versions.id
#       vault_id           = var.vault_id
#     }
#   }
#   hostname        = local.dbcs_hostname
#   ssh_public_keys = [var.ssh_public_key]
#   subnet_id       = var.privatesubnet_id

#   cpu_core_count = "1" // XXX

#   data_storage_size_in_gb = "256" // XXX
#   database_edition        = "ENTERPRISE_EDITION"
#   db_system_options {
#     storage_management = "LVM"
#   }
#   disk_redundancy    = "NORMAL"
#   shape              = "VM.Standard2.1" // XXX
#   display_name       = local.dbcs_name
#   domain             = local.dbcs_domain
#   kms_key_id         = var.master_key_id
#   kms_key_version_id = data.oci_kms_key_versions.master_key_versions.id
#   license_model      = "LICENSE_INCLUDED"
#   node_count         = "1"
#   # nsg_ids            = var.db_system_nsg_ids
#   # private_ip         = var.db_system_private_ip
#   # source             = var.db_system_source
#   sparse_diskgroup = true
#   # storage_volume_performance_mode = var.db_system_storage_volume_performance_mode
# }

# resource "oci_database_database" "dbcs" {
#   database {
#     admin_password = random_password.dbcs_admin_password.result
#     db_name        = local.dbcs_name

#     character_set = "AL32UTF8"
#     # database_software_image_id = oci_database_database_software_image.test_database_software_image.id
#     db_unique_name     = local.dbcs_name
#     db_workload        = "OLTP"
#     kms_key_id         = var.master_key_id
#     kms_key_version_id = data.oci_kms_key_versions.master_key_versions.id
#     ncharacter_set     = "AL16UTF16"
#     pdb_name           = local.pdb_name
#     vault_id           = var.vault_id
#   }
#   db_home_id = "NONE" //  [DB_BACKUP NONE] oci_database_db_home.test_db_home.id
#   source     = "NONE" // var.database_source

#   db_version         = "19.0.0.0"
#   kms_key_id         = var.master_key_id
#   kms_key_version_id = data.oci_kms_key_versions.master_key_versions.id
# }
