variable "cluster-name" {}
variable "project" {}
variable "cidr-block" {}
variable "region" {}
variable "jump-zone" {}
variable "vpc-name" {}
variable "env" {}
variable "igw-name" {}
variable "static-ip-name"{}
variable "router-name"{}
variable "cloud-nat-name"{}
variable "pub-cidr-block" {}
variable "pub-sub-name" {}
variable "pri-cidr-block" {}
variable "sec-pod-cidr-block" {}
variable "sec-service-cidr-block" {}
variable "pri-sub-name" {}
variable "public-rt-name" {}
variable "private-rt-name" {}
variable "gke-ingress-fw-rule" {}
variable "gke-egress-fw-rule" {
  
}

variable "cluster-version" {}
variable "endpoint-private-access" {}
variable "endpoint-public-access" {}
variable "ondemand_instance_types" {}
variable "spot_instance_types" {}
variable "desired_capacity_on_demand" {}
variable "min_capacity_on_demand" {}
variable "max_capacity_on_demand" {}
variable "desired_capacity_spot" {}
variable "min_capacity_spot" {}
variable "max_capacity_spot" {}