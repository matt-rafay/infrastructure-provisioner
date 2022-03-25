variable "action" {
  type = string
}

variable "blueprint_name" {
  type    = string
  default = "minimal"
}

variable "blueprint_version" {
  type    = string
  default = null
}

variable "cluster_name" {
  type = string
}

variable "gcp_project" {
  type = string
}

variable "gke_add_on_dns_cache" {
  type    = bool
  default = false
}

variable "gke_add_on_hpa" {
  type    = bool
  default = true
}

variable "gke_add_on_http_lb" {
  type    = bool
  default = true
}

variable "gke_authorized_networks" {
  type    = list(object({cidr = string, name = string}))
  default = []
}

variable "gke_auto_repair" {
  type    = bool
  default = true
}

variable "gke_auto_upgrade" {
  type    = bool
  default = true
}

variable "gke_cluster_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "gke_image_type" {
  type    = string
  default = "COS_CONTAINERD"
}

variable "gke_locations" {
  type    = list(string)
  default = []
}

variable "gke_master_cidr" {
  type    = string
  default = "192.168.0.0/28"
}

variable "gke_network_policy" {
  type    = bool
  default = true
}

variable "gke_node_pools" {
  type    = list(string)
  default = ["worker"]
}

variable "gke_oauth_scopes" {
  type    = list(string)
  default = [
    "https://www.googleapis.com/auth/compute",
    "https://www.googleapis.com/auth/devstorage.read_only",
    "https://www.googleapis.com/auth/logging.write",
    "https://www.googleapis.com/auth/monitoring",
    "https://www.googleapis.com/auth/servicecontrol",
    "https://www.googleapis.com/auth/service.management.readonly",
    "https://www.googleapis.com/auth/trace.append"
  ]
}

variable "gke_private_cluster" {
  type    = bool
  default = true
}

variable "gke_private_endpoint" {
  type    = bool
  default = false
}

variable "gke_release_channel" {
  type    = string
  default = null
}

variable "gke_resource_labels" {
  type    = map(string)
  default = {}
}

variable "gke_service_cidr" {
  type    = string
  default = "10.32.0.0/16"
}

variable "gke_version" {
  type = string
}

variable "include_cluster" {
  type    = bool
  default = true
}

variable "include_nat" {
  type    = bool
  default = true
}

variable "include_vpc" {
  type    = bool
  default = true
}

variable "node_disk_size" {
  type    = number
  default = 20
}

variable "node_disk_type" {
  type    = string
  default = "pd-standard"
}

variable "node_pods" {
  type    = number
  default = 110
}

variable "node_pool_count" {
  type    = number
  default = 3
}

variable "node_pool_max" {
  type    = number
  default = 5
}

variable "node_pool_min" {
  type    = number
  default = 1
}

variable "node_type" {
  type    = string
  default = "e2-medium"
}

variable "project" {
  type = string
}

variable "region" {
  type = string
}

variable "router_name" {
  type    = string
  default = null
}

variable "subnet" {
  type    = string
  default = null
}

variable "subnet_cidr" {
  type = string
}

variable "subnet_name" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "vpc" {
  type = string
  default = null
}

variable "vpc_name" {
  type    = string
  default = null
}

variable "zone" {
  type = string
}