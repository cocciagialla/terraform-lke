terraform {
  required_version = ">= 1.0.0"

  required_providers {
    linode = {
      source = "linode/linode"
      version = "1.29.4"
    }
  }
}
