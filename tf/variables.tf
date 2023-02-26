variable "cluster_label" {
  description = "LKE Cluster lable"
  default     = "bpiche-assessment"
}

variable "k8s_version" {
  description = "Kubernetes version"
  default     = "1.25"
}

variable "cluster_region" {
  description = "LKE Cluster region"
  default     = "us-central"
}

variable "cluster_node_type" {
  description = "LKE Cluster node type"
  default     = "g6-standard-1"
}

variable "linode_token" {}