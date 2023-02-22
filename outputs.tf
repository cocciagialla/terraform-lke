//Export this cluster's attributes
output "kubeconfig" {
  value = base64decode(linode_lke_cluster.kubernetes-cluster.kubeconfig)
  sensitive = true
}

output "api_endpoints" {
  value = linode_lke_cluster.kubernetes-cluster.api_endpoints
}

output "status" {
  value = linode_lke_cluster.kubernetes-cluster.status
}

output "id" {
  value = linode_lke_cluster.kubernetes-cluster.id
}

output "pool" {
  value = linode_lke_cluster.kubernetes-cluster.pool
}
