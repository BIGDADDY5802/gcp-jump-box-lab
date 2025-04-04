/*FIREWALL-RULES*/

#External-RDP-Ingress-rule
resource "google_compute_firewall" "external-rdp-ingress" {
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
resource "google_compute_firewall" "internal-rdp-ingress" {
  name        = "internal-transit"
  network     = var.network-det.name
  allow {
    protocol = "tcp"
    ports    = ["3389"]
  }

  source_tags   = ["rdp-for-poopers"] 
  target_tags   = ["rdp-for-scoopers"]
  depends_on = [module.network]
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

  source_tags   = ["rdp-for-scoopers"]
  target_tags   = ["http-for-demons"]
  depends_on = [module.network]
}
#>>>>>-------------------------------------------------------------------------

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
