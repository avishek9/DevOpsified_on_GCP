variable "region" {}
variable "project" {}
variable "jump-zone" {

}
variable "env" {}
variable "cluster-name" {}
variable "vpc-cidr-block" {}
variable "vpc-name" {}
variable "pub-cidr-block" {}
variable "static-ip-name" {}
variable "router-name" {}
variable "cloud-nat-name" {}
variable "pub-sub-name" {}
variable "pri-cidr-block" {}
variable "sec-pod-cidr-block" {}
variable "sec-service-cidr-block" {}


variable "pri-sub-name" {}
variable "public-rt-name" {}
variable "private-rt-name" {}
variable "gke-egress-fw-rule" {}
variable "gke-ingress-fw-rule" {}
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