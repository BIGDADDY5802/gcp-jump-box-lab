/*FIREWALL-RULES*/

#External-RDP-Ingress-rule
resource "google_compute_firewall" "http-ingress" {
  name        = "public-transit"
  network     = var.network-det.name
  allow {
    protocol = "tcp"
    ports    = ["3389"]
  }

  source_ranges = ["0.0.0.0/0"]
  depends_on = [module.network]
  target_tags   = ["rdp-for-poopers"]
}
#>>>
#Internal-RDP-Ingress-rule
resource "google_compute_firewall" "rdp-internal-ingress" {
  name        = "internal-transit"
  network     = var.network-det.name
  allow {
    protocol = "tcp"
    ports    = ["3389"]
  }

  source_ranges = [var.network-det.nodes_cidr_range, var.network-det.sec_cidr_range] 
  depends_on = [module.network]
  target_tags   = ["rdp-for-scoopers"]
}
#>>>
#Internal-http-ingress-rule
resource "google_compute_firewall" "http-internal-ingress" {
  name        = "internal-web-transit"
  network     = var.network-det.name
  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = [var.network-det.nodes_2_cidr_range, var.network-det.sec_cidr_2_range]
  target_tags   = ["http-for-demons"]
}
#>>>
#Allow IAP Access For Instance Management
resource "google_compute_firewall" "allow_iap" {
  name    = "secret-service"
  network = var.network-det.name
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_ranges = data.google_netblock_ip_ranges.iap_forwarders.cidr_blocks_ipv4
  target_tags   = ["allow-iap"]
  depends_on = [module.network]
}
#>>>
#IAP-CONFIGURATION
data "google_netblock_ip_ranges" "iap_forwarders" {
  range_type = "iap-forwarders"
}
#>>>
