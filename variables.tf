variable "linode_token" {
  description = "Your Linode API Personal Access Token. (required)"
  type = string
}

variable "cluster_version" {
  description = "The Kubernetes version to use for this cluster. (required)"
  type = string
  default = "1.23"
}

variable "cluster_name" {
  description = "The unique label to assign to this cluster. (required)"
  type = string
  default = "default-lke-cluster"
}

variable "linode_region" {
  description = "The region where your cluster will be located. (required)"
  type = string
  default = "eu-central"
}

variable "tags" {
  description = "Tags to apply to your cluster for organizational purposes. (optional)"
  type =object({
    env       = string
    repo      = string
    repo_ver  = string
    project   = string
  })
}

variable "lke_pools" {
  description = "The Node Pool specifications for the Kubernetes cluster. (required)"
  type = list(object({
    type = string
    count = number
    min_size = number
    max_size = number
  }))
  default = [
    {
      type = "g6-standard-2"
      count = 2
      min_size = 1
      max_size = 2
    }
  ]
}


