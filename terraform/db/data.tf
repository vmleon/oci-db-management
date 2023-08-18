data "oci_identity_tenancy" "tenant_details" {
  tenancy_id = var.tenancy_ocid

  provider = oci
}

data "oci_identity_regions" "home_region" {
  filter {
    name   = "key"
    values = [data.oci_identity_tenancy.tenant_details.home_region_key]
  }

  provider = oci
}

data "oci_identity_compartment" "compartment" {
  id = var.compartment_ocid
}

data "oci_identity_availability_domains" "ads" {
  compartment_id = var.tenancy_ocid
}

data "oci_kms_key_versions" "master_key_versions" {
  key_id              = var.master_key_id
  management_endpoint = data.oci_kms_vault.vault.management_endpoint
}

data "oci_kms_vault" "vault" {
  vault_id = var.vault_id
}

# data "oci_database_db_nodes" "db_nodes" {
#   compartment_id = var.compartment_ocid
#   db_system_id   = oci_database_db_system.db_system.id
# }

# data "oci_database_db_node" "db_node_details" {
#   db_node_id = data.oci_database_db_nodes.db_nodes.db_nodes[0]["id"]
# }

# data "oci_database_db_homes" "db_homes" {
#   compartment_id = var.compartment_ocid
#   db_system_id   = oci_database_db_system.db_system.id
# }

# data "oci_database_databases" "databases" {
#   compartment_id = var.compartment_ocid
#   db_home_id     = data.oci_database_db_homes.db_homes.db_homes[0].db_home_id
# }

# data "oci_database_db_versions" "test_db_versions_by_db_system_id" {
#   compartment_id = var.compartment_ocid
#   db_system_id   = oci_database_db_system.db_system.id
# }

data "oci_database_db_system_shapes" "db_system_shapes" {
  availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
  compartment_id      = var.compartment_ocid

  filter {
    name   = "shape"
    values = ["VM.Standard2.1"]
  }
}
