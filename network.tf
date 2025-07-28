
resource "oci_core_virtual_network"  "vnc" {
  cidr_block     = "10.1.0.0/16"
  compartment_id = oci_identity_compartment.compartment.id
  display_name   = "${var.project_name}_vcn"
  dns_label      = "${replace(var.project_name, "_", "")}Vcn"
}

resource "oci_core_subnet" "subnet" {
  cidr_block        = "10.1.0.0/24"
  display_name      = "${var.project_name}_subnet"
  dns_label         = "${replace(var.project_name, "_", "")}Subnet"
  security_list_ids = [oci_core_security_list.security_list.id]
  compartment_id    = oci_identity_compartment.compartment.id
  vcn_id            = oci_core_virtual_network.vnc.id
  route_table_id    = oci_core_route_table.route_table.id
  dhcp_options_id   = oci_core_virtual_network.vnc.default_dhcp_options_id
}

resource "oci_core_internet_gateway" "internet_gateway" {
  compartment_id = oci_identity_compartment.compartment.id
  display_name   = "${var.project_name}_internet_gateway"
  vcn_id         = oci_core_virtual_network.vnc.id
}

resource "oci_core_route_table" "route_table" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_virtual_network.vnc.id
  display_name   = "${var.project_name}_route_table"

  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.internet_gateway.id
  }
}

resource "oci_core_security_list" "security_list" {
  compartment_id = oci_identity_compartment.compartment.id
  vcn_id         = oci_core_virtual_network.vnc.id
  display_name   = "${var.project_name}_security_list"

  egress_security_rules {
    protocol    = "6"
    destination = "0.0.0.0/0"
  }

  ingress_security_rules {
    protocol = "6"
    source   = "0.0.0.0/0"

    tcp_options {
      max = "22"
      min = "22"
    }
  }

  ingress_security_rules {
    protocol = "6"
    source   = "0.0.0.0/0"

    tcp_options {
      max = "80"
      min = "80"
    }
  }
}