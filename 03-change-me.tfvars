#NETWORK
network-det = {
    name                = "griffin-school-network"
    subnetwork_name     = "kaer-seren-swiss"
    nodes_cidr_range    = "10.132.76.0/24"
    sec_cidr_range      = "10.132.77.0/24"
    region              = "europe-west6"
    sec                 = "swiss-gruyere"
    subnetwork_2_name   = "kaer-seren-italiano"
    nodes_2_cidr_range  = "10.132.66.0/24"
    sec_cidr_2_range    = "10.132.67.0/24"
    region_2            = "europe-west12"
    sec_2               = "italiano-parmegianno"
    subnetwork_3_name   = "kaer-seren-norde"
    nodes_3_cidr_range  = "10.132.56.0/24"
    sec_cidr_3_range    = "10.132.57.0/24"
    region_3            = "europe-north2"
    sec_3               = "hushallsost"
}
#>>>

#VMS
region_1_vm_detail = {
    name         = "witcher-george"
    machine_type = "e2-highmem-2"
    zone         = "europe-west6-a"
    image        = "projects/windows-cloud/global/images/windows-server-2022-dc-v20240415"
    subnetwork   = "projects/pooper-scooper/regions/europe-west6/subnetworks/kaer-seren-swiss"      
    service      = "876288284083-compute@developer.gserviceaccount.com"    
}

region_2_vm_detail = {
    name         = "witcher-enzo"
    machine_type = "e2-highmem-2"
    zone         = "europe-west12-a"
    image        = "projects/windows-cloud/global/images/windows-server-2022-dc-v20240415"
    subnetwork   = "projects/pooper-scooper/regions/europe-west12/subnetworks/kaer-seren-italiano"      
    service      = "876288284083-compute@developer.gserviceaccount.com"    
}

region_3_vm_detail = {
    name         = "witcher-gustavus-adolphus"
    machine_type = "e2-small"
    zone         = "europe-north2-a"
    image        = "projects/debian-cloud/global/images/debian-11-bullseye-v20241210"
    subnetwork   = "projects/pooper-scooper/regions/europe-north2/subnetworks/kaer-seren-norde"      
    service      = "876288284083-compute@developer.gserviceaccount.com"   
}

