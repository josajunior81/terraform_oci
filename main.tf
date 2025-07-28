data "oci_identity_availability_domains" "ads" {
  compartment_id = var.tenancy_ocid
}

resource "oci_identity_compartment" "compartment" {
    compartment_id = var.tenancy_ocid
    description = "${var.project_name} compartment"
    name = "${var.project_name}_compartment"
}