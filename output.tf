output "source_details" {
  description = "The source details of the instance"
  value = oci_core_instance.instance.source_details
}

output "external_ip" {
  description = "The public IP address of the instance"
  value = oci_core_instance.instance.public_ip
}