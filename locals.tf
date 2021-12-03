locals {
  metadata = {
    project             = "hpcc_k8s"
    product_name        = var.product_name
    business_unit       = "infra"
    environment         = "sandbox"
    market              = "us"
    product_group       = "solutionslab"
    resource_group_type = "app"
    sre_team            = "solutionslab"
    subscription_type   = "dev"
  }

  names = module.metadata.names

  #----------------------------------------------------------------------------

  enforced_tags = {
    "admin" = var.admin_name
    "email" = var.admin_email
    "owner" = var.admin_name
    "owner_email" = var.admin_email
  }
  tags = merge(module.metadata.tags, local.enforced_tags, try(var.extra_tags, {}))

  #----------------------------------------------------------------------------

  aks_cluster_name = "${local.names.resource_group_type}-${local.names.product_name}-terraform-${local.names.location}-${var.admin_username}-${terraform.workspace}"

  #----------------------------------------------------------------------------

  node_pools = {
    system = {
      vm_size             = "Standard_B2s"
      node_count          = 1
      enable_auto_scaling = true
      min_count           = 1
      max_count           = 2
    }

    addpool1 = {
      vm_size             = var.node_size
      enable_auto_scaling = true
      min_count           = 1
      max_count           = var.max_node_count
    }
  }

  #----------------------------------------------------------------------------
  # Corporate networks to automatically include in AKS admin and HPCC user access
  default_admin_ip_cidr_maps = {
    "alpharetta" = "66.241.32.0/19"
    "boca"       = "209.243.48.0/20"
  }

  #----------------------------------------------------------------------------

  is_windows_os = substr(pathexpand("~"), 0, 1) == "/" ? false : true
  az_command = try("az aks get-credentials --name ${module.kubernetes.name} --resource-group ${module.resource_group.name} --overwrite --admin", "")
}
