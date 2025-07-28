
resource "tls_private_key" "compute_ssh_key" {
  algorithm = "ED25519"
}

resource "oci_core_instance" "instance" {
  availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
  compartment_id      = oci_identity_compartment.compartment.id
  shape               = var.shape
  display_name = "${var.project_name}_instance"
  preserve_boot_volume = false

  create_vnic_details {
    assign_public_ip = true
    subnet_id = oci_core_subnet.subnet.id
    display_name = "${var.project_name}_vnic"
    hostname_label = "${replace(var.project_name, "_", "")}instance"
  }

  source_details {
    source_type = "image"
    source_id     = var.ubuntu_image
  }

  metadata = {
    ssh_authorized_keys = trimspace(tls_private_key.compute_ssh_key.public_key_openssh), user_data = filebase64("user-data-ubuntu.sh")
  }
}

resource "local_file" "private_key_openssh_file" {
  filename = "${path.module}/.ssh/private_key_openssh.key"
  content  = tls_private_key.compute_ssh_key.private_key_openssh
  file_permission = "0600"
}


resource "local_file" "private_key_pem_file" {
  filename = "${path.module}/.ssh/private_key.pem"
  content  = tls_private_key.compute_ssh_key.private_key_pem
  file_permission = "0600"
}

resource "local_file" "public_key_pem_file" {
  filename = "${path.module}/.ssh/public_key.pem"
  content  = tls_private_key.compute_ssh_key.public_key_pem
}

resource "local_file" "public_key_openssh_file" {
  filename = "${path.module}/.ssh/public_key.pub"
  content  = tls_private_key.compute_ssh_key.public_key_openssh
}

