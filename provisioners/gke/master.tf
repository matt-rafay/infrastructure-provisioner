terraform {
  required_version = ">= 1.1.4"
}

locals {
  cluster_spec = templatefile("cluster-spec.tftpl", {
    blueprint_name    = var.blueprint_name,
    blueprint_version = var.blueprint_version,
    cluster_name      = var.cluster_name,
    gcp_project       = var.gcp_project,
    project           = var.project,
    region            = var.region,
    zone              = var.zone
  })
  
  deployment = templatefile("deployment.tftpl", {
    cluster_name            = var.cluster_name,
    description             = local.description,
    gke_add_on_dns_cache    = var.gke_add_on_dns_cache,
    gke_add_on_hpa          = var.gke_add_on_hpa,
    gke_add_on_http_lb      = var.gke_add_on_http_lb,
    gke_authorized_networks = var.gke_authorized_networks,
    gke_auto_repair         = var.gke_auto_repair,
    gke_auto_upgrade        = var.gke_auto_upgrade,
    gke_cluster_cidr        = var.gke_cluster_cidr,
    gke_image_type          = var.gke_image_type,
    gke_locations           = var.gke_locations,
    gke_master_cidr         = var.gke_master_cidr,
    gke_network_policy      = var.gke_network_policy,
    gke_node_pools          = var.gke_node_pools,
    gke_oauth_scopes        = var.gke_oauth_scopes,
    gke_private_cluster     = var.gke_private_cluster,
    gke_private_endpoint    = var.gke_private_endpoint,
    gke_release_channel     = var.gke_release_channel,
    gke_resource_labels     = var.gke_resource_labels,
    gke_service_cidr        = var.gke_service_cidr,
    gke_version             = var.gke_version,
    include_cluster         = var.include_cluster,
    include_nat             = var.include_nat,
    include_vpc             = var.include_vpc,
    node_disk_size          = var.node_disk_size,
    node_disk_type          = var.node_disk_type,
    node_pods               = var.node_pods,
    node_pool_count         = var.node_pool_count,
    node_pool_max           = var.node_pool_max,
    node_pool_min           = var.node_pool_min,
    node_type               = var.node_type,
    region                  = var.region,
    router_name             = var.router_name,
    subnet                  = var.subnet,
    subnet_cidr             = var.subnet_cidr,
    subnet_name             = var.subnet_name,
    tags                    = var.tags,
    vpc                     = var.vpc,
    vpc_name                = var.vpc_name,
    zone                    = var.zone
  })
  
  description = join(", ", formatlist("\\\"%s=%s\\\"", keys(var.tags), values(var.tags)))
}

resource "local_file" "cluster_spec" {
  content  = local.cluster_spec
  filename = "cluster-spec.yaml"
  
  depends_on = [
    local.cluster_spec
  ]
}

resource "local_file" "deployment" {
  content  = local.deployment
  filename = "deployment.yaml"
  
  depends_on = [
    local.deployment
  ]
}

resource "null_resource" "local_exec" {
  provisioner "local-exec" {
    command     = "run.sh"
    interpreter = ["/bin/bash"]
    environment = {
      ACTION       = var.action,
      CLUSTER_NAME = var.cluster_name,
      PROJECT      = var.project
    }
  }
  
  depends_on = [
    local_file.deployment
  ]
}

output "cluster_spec" {
  value = local.cluster_spec
}

output "deployment" {
  value = local.deployment
}