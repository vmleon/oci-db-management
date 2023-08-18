resource "oci_core_virtual_network" "vcn_db_mgmt" {
  compartment_id = var.compartment_ocid
  cidr_blocks    = ["10.0.0.0/16"]
  display_name   = "DBMgmt VCN"
  dns_label      = "dbmgmt"
}

resource "oci_core_internet_gateway" "internet_gateway_db_mgmt" {
  compartment_id = var.compartment_ocid
  display_name   = "InternetGateway"
  vcn_id         = oci_core_virtual_network.vcn_db_mgmt.id
}

resource "oci_core_default_route_table" "default_route_table" {
  manage_default_resource_id = oci_core_virtual_network.vcn_db_mgmt.default_route_table_id
  display_name               = "DefaultRouteTable"

  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.internet_gateway_db_mgmt.id
  }
}

resource "oci_core_subnet" "publicsubnet" {
  cidr_block        = "10.0.0.0/24"
  compartment_id    = var.compartment_ocid
  vcn_id            = oci_core_virtual_network.vcn_db_mgmt.id
  display_name      = "public subnet"
  dns_label         = "public"
  security_list_ids = [oci_core_virtual_network.vcn_db_mgmt.default_security_list_id]
  route_table_id    = oci_core_virtual_network.vcn_db_mgmt.default_route_table_id
  dhcp_options_id   = oci_core_virtual_network.vcn_db_mgmt.default_dhcp_options_id
}

resource "oci_core_subnet" "privatesubnet" {
  cidr_block                 = "10.0.1.0/24"
  compartment_id             = var.compartment_ocid
  vcn_id                     = oci_core_virtual_network.vcn_db_mgmt.id
  display_name               = "private subnet"
  dns_label                  = "private"
  prohibit_public_ip_on_vnic = true
  security_list_ids          = [oci_core_virtual_network.vcn_db_mgmt.default_security_list_id]
  route_table_id             = oci_core_virtual_network.vcn_db_mgmt.default_route_table_id
  dhcp_options_id            = oci_core_virtual_network.vcn_db_mgmt.default_dhcp_options_id
}
