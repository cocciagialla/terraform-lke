resource "linode_lke_cluster" "kubernetes-cluster" {
  k8s_version = var.cluster_version
  label = var.cluster_name
  region = var.linode_region
  tags = [format("%s-%s", var.tags.project, var.tags.env), format("%s:%s", var.tags.repo, var.tags.repo_ver)]

  dynamic "pool" {
    for_each = var.lke_pools
    content {
      type  = pool.value["type"]
      count = pool.value["count"]

      autoscaler {
        min = pool.value["min_size"]
        max = pool.value["max_size"]
      }
    }
  }

  lifecycle {
    ignore_changes = [
      pool.0.count
    ]
  }
}



