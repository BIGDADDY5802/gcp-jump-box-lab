variable "network" { #When you us nested objects withina variable, to call upon your selected object, 
  type = object({ #you must use the dot notation.
    name                = string
    subnetwork_1_name     = string
    nodes_1_cidr_range    = string
    sec_cidr_1_range      = string
    region_1              = string
    sec_1                 = string
    subnetwork_2_name     = string
    nodes_2_cidr_range    = string
    sec_cidr_2_range      = string
    region_2              = string
    sec_2                 = string
    subnetwork_3_name     = string
    nodes_3_cidr_range    = string
    sec_cidr_3_range      = string
    region_3              = string
    sec_3                 = string
  })
}



/*
#VM NETWORK 2 SUBNET 1 INSTANCE 1
resource "google_compute_instance" "vm_instance_2" {
  name         = var.vm2_name
  machine_type = var.vm2_machine_type
  zone         = var.vm2_zone

  boot_disk {
    initialize_params {
      image = var.vm2_image
      size = 50 
      type = "pd-balanced"
    }
  }

  network_interface {
    access_config {
      // Ephemeral IP
      network_tier = "PREMIUM"
    }
    subnetwork = var.vm2_subnetwork
    stack_type  = "IPV4_ONLY"
  }

  service_account {
    email  = "876288284083-compute@developer.gserviceaccount.com"
    scopes = ["https://www.googleapis.com/auth/devstorage.read_only", "https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/monitoring.write", "https://www.googleapis.com/auth/service.management.readonly", "https://www.googleapis.com/auth/servicecontrol", "https://www.googleapis.com/auth/trace.append"]
  }
  depends_on = [ google_compute_subnetwork.network2_sub1 ]
}
#>>>
*/