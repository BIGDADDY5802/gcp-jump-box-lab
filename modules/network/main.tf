/*NETWORK*/

#Host-Network
resource "google_compute_network" "net-1" {
  name                    = var.network.name
  auto_create_subnetworks = false
  routing_mode            = "REGIONAL"
  mtu                     = 1500
}
#>>>

#Subnet-1
resource "google_compute_subnetwork" "sub-1" {
  name          = var.network.subnetwork_1_name
  ip_cidr_range = var.network.nodes_1_cidr_range
  region        = var.network.region_1
  network       = var.network.name
  private_ip_google_access = "true"
  depends_on = [ google_compute_network.net-1 ]
#>>>
#Secondary Ranges --> For Kubernetes
  secondary_ip_range {
    range_name    = var.network.sec_1
    ip_cidr_range = var.network.sec_cidr_1_range
  }
}
#>>>

#Subnet-2
resource "google_compute_subnetwork" "sub-2" {
  name          = var.network.subnetwork_2_name
  ip_cidr_range = var.network.nodes_2_cidr_range
  region        = var.network.region_2
  network       = var.network.name
  private_ip_google_access = "true"
  depends_on = [ google_compute_network.net-1 ]
#>>>
#Secondary Ranges --> For Kubernetes
  secondary_ip_range {
    range_name    = var.network.sec_2 
    ip_cidr_range = var.network.sec_cidr_2_range
  }
}
#>>>

#Subnet-3
resource "google_compute_subnetwork" "sub-3" {
  name          = var.network.subnetwork_3_name
  ip_cidr_range = var.network.nodes_3_cidr_range
  region        = var.network.region_3
  network       = var.network.name
  private_ip_google_access = "true"
  depends_on = [ google_compute_network.net-1 ]
#>>>
#Secondary Ranges --> For Kubernetes
  secondary_ip_range {
    range_name    = var.network.sec_3 
    ip_cidr_range = var.network.sec_cidr_3_range
  }
}
#>>>




/*
variable "network" { #When you us nested objects withina variable, to call upon your selected object, 
  type = object({ #you must use the dot notation.
    name                = string
    subnetwork_1_name     = string
    nodes_1_cidr_range    = string
    sec_cidr_1_range      = string
    region_1              = string
    sec_1                 = string
  })
}
*/