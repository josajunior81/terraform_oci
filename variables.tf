## Authorization Variables
variable "tenancy_ocid" {
  description = "The OCID of the tenancy"
  type        = string
}

variable "user_ocid" {
  description = "The OCID of the user"
  type        = string
}
variable "compartment_ocid" {
  description = "The OCID of the compartment"
  type        = string
}
variable "fingerprint" {
  description = "The fingerprint of the API key"
  type        = string
}

variable "private_key_path" {
  description = "The path to the private key file"
  type        = string
}

variable "region" {
  description = "The region to use for the OCI resources"
  type        = string
}

## Instance Variables
variable "project_name" {
  description = "The name of the project"
  type        = string
}

variable "ubuntu_image" {
  description = "The OCID of the image to use for the instance"
  type        = string
  default = "ocid1.image.oc1.sa-saopaulo-1.aaaaaaaadwxporzjrx24ul2gub5fsoqgaekd6uxwurpqsvzpwcqutyovzk2a"
}

variable "oracle_linux_image" {
  description = "The OCID of the image to use for the instance"
  type        = string
  default = "ocid1.image.oc1.sa-saopaulo-1.aaaaaaaah5te467kszbpp5bg2ayxx5prgzujv4l23adutaij6sbe53ys5gqa"
}

variable "shape" {
  description = "The shape of the instance"
  type        = string
}

variable "subnet" {
  description = "The OCID of the subnet in which to launch the instance"
  type        = string
}

variable "public_key_instance" {
  description = "The path to the public key file for the instance"
  type        = string
}


