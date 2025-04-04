variable "region_1_vm" {
  type = object({
    name                = string
    machine_type        = string
    zone                = string
    image               = string
    subnetwork          = string
    service             = string
  })
}

variable "region_2_vm" {
  type = object({
    name                = string
    machine_type        = string
    zone                = string
    image               = string
    subnetwork          = string
    service             = string
  })
}

variable "region_3_vm" {
  type = object({
    name                = string
    machine_type        = string
    zone                = string
    image               = string
    subnetwork          = string
    service             = string
  })
}
