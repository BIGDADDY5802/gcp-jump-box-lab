#>>> RDP INSTANCE SUBNET 1
resource "google_compute_instance" "vm_instance_1" {
  name         = var.region_1_vm.name
  machine_type = var.region_1_vm.machine_type
  zone         = var.region_1_vm.zone

  boot_disk {
    initialize_params {
      image = var.region_1_vm.image
      size = 50 
      type = "pd-balanced"
    }
  }

  network_interface {
    access_config {
      // Ephemeral IP
      network_tier = "PREMIUM"
    }
    subnetwork = var.region_1_vm.subnetwork
    stack_type  = "IPV4_ONLY"
  }

  service_account {
    email  = var.region_1_vm.service
    scopes = ["https://www.googleapis.com/auth/devstorage.read_only", "https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/monitoring.write", "https://www.googleapis.com/auth/service.management.readonly", "https://www.googleapis.com/auth/servicecontrol", "https://www.googleapis.com/auth/trace.append"]
  }
  tags = ["rdp-for-poopers"]
}
#>>>

#>>> RDP INSTANCE SUBNET 2
resource "google_compute_instance" "vm_instance_2" {
  name         = var.region_2_vm.name
  machine_type = var.region_2_vm.machine_type
  zone         = var.region_2_vm.zone

  boot_disk {
    initialize_params {
      image = var.region_2_vm.image
      size = 50 
      type = "pd-balanced"
    }
  }

  network_interface {
    subnetwork = var.region_2_vm.subnetwork
    stack_type  = "IPV4_ONLY"
  }

  service_account {
    email  = var.region_2_vm.service
    scopes = ["https://www.googleapis.com/auth/devstorage.read_only", "https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/monitoring.write", "https://www.googleapis.com/auth/service.management.readonly", "https://www.googleapis.com/auth/servicecontrol", "https://www.googleapis.com/auth/trace.append"]
  }
  tags = ["rdp-for-scoopers"]
}
#>>>

#>>> WEB SERVER INSTANCE
resource "google_compute_instance" "vm_instance_3" {
  name         = var.region_3_vm.name
  machine_type = var.region_3_vm.machine_type
  zone         = var.region_3_vm.zone

  boot_disk {
    initialize_params {
      image = var.region_3_vm.image
      size = 50 
      type = "pd-balanced"
    }
  }

  network_interface {
    subnetwork = var.region_3_vm.subnetwork
    stack_type  = "IPV4_ONLY"
  }

  metadata_startup_script = file("${path.root}/script.sh")

  service_account {
    email  = var.region_3_vm.service
    scopes = ["https://www.googleapis.com/auth/devstorage.read_only", "https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/monitoring.write", "https://www.googleapis.com/auth/service.management.readonly", "https://www.googleapis.com/auth/servicecontrol", "https://www.googleapis.com/auth/trace.append"]
  }
  tags = ["http-for-demons"]
  
}
#>>>
