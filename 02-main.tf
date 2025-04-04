/*NETWORK*/

#NETWORK-MODULE
module "network" {
  source = "./modules/network"
  network = {
    name = var.network-det.name
    subnetwork_1_name     = var.network-det.subnetwork_name
    nodes_1_cidr_range    = var.network-det.nodes_cidr_range
    sec_cidr_1_range      = var.network-det.sec_cidr_range
    region_1              = var.network-det.region
    sec_1                 = var.network-det.sec
    subnetwork_2_name     = var.network-det.subnetwork_2_name
    nodes_2_cidr_range    = var.network-det.nodes_2_cidr_range
    sec_cidr_2_range      = var.network-det.sec_cidr_2_range
    region_2              = var.network-det.region_2
    sec_2                 = var.network-det.sec_2
    subnetwork_3_name     = var.network-det.subnetwork_3_name
    nodes_3_cidr_range    = var.network-det.nodes_3_cidr_range
    sec_cidr_3_range      = var.network-det.sec_cidr_3_range
    region_3              = var.network-det.region_3
    sec_3                 = var.network-det.sec_3
  }
}
#>>>

#NETWORK-VARIABLE MAP >>> Links to the Tf vars sheet
variable "network-det" { #When you us nested objects within a variable, to call upon your selected object, 
  type = object({ #you must use the dot notation .
    name                = string
    subnetwork_name     = string
    nodes_cidr_range    = string
    sec_cidr_range      = string
    region              = string
    sec                 = string
    subnetwork_2_name   = string
    nodes_2_cidr_range  = string
    sec_cidr_2_range    = string
    region_2            = string
    sec_2               = string
    subnetwork_3_name   = string
    nodes_3_cidr_range  = string
    sec_cidr_3_range    = string
    region_3            = string
    sec_3               = string

  })
}
#>>>>>-------------------------------------------------------------------------

/*COMPUTE*/

#COMPUTE-MODULE
module "compute" {
  source = "./modules/compute"
   region_1_vm = {
    name                = var.region_1_vm_detail.name
    machine_type        = var.region_1_vm_detail.machine_type
    zone                = var.region_1_vm_detail.zone
    image               = var.region_1_vm_detail.image
    subnetwork          = var.region_1_vm_detail.subnetwork
    service             = var.region_1_vm_detail.service
  }
  region_2_vm = {
    name                = var.region_2_vm_detail.name
    machine_type        = var.region_2_vm_detail.machine_type
    zone                = var.region_2_vm_detail.zone
    image               = var.region_2_vm_detail.image
    subnetwork          = var.region_2_vm_detail.subnetwork
    service             = var.region_2_vm_detail.service
  }
  region_3_vm = {
    name                = var.region_3_vm_detail.name
    machine_type        = var.region_3_vm_detail.machine_type
    zone                = var.region_3_vm_detail.zone
    image               = var.region_3_vm_detail.image
    subnetwork          = var.region_3_vm_detail.subnetwork
    service             = var.region_3_vm_detail.service
  }
  depends_on = [module.network]
}
#>>>

#COMPUTE-VARIABLE MAP >>> Links to the Tf vars sheet
variable "region_1_vm_detail" {
  type = object({
    name                = string
    machine_type        = string
    zone                = string
    image               = string
    subnetwork          = string
    service             = string
  })
}

variable "region_2_vm_detail" {
  type = object({
    name                = string
    machine_type        = string
    zone                = string
    image               = string
    subnetwork          = string
    service             = string
  })
}

variable "region_3_vm_detail" {
  type = object({
    name                = string
    machine_type        = string
    zone                = string
    image               = string
    subnetwork          = string
    service             = string
  })
}
#>>>

