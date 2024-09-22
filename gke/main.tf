locals {
  org = "medium"
  env = var.env
}

module "gke" {
  source = "../module"

  env                        = var.env
  jump-zone                  = var.jump-zone
  project                    = var.project
  sec-pod-cidr-block         = var.sec-service-cidr-block
  sec-service-cidr-block     = var.sec-service-cidr-block
  region                     = var.region
  cloud-nat-name             = var.cloud-nat-name
  router-name                = var.router-name
  static-ip-name             = var.static-ip-name
  cluster-name               = "${local.env}-${local.org}-${var.cluster-name}"
  cidr-block                 = var.vpc-cidr-block
  vpc-name                   = "${local.env}-${local.org}-${var.vpc-name}"
  igw-name                   = "${local.env}-${local.org}-${var.igw-name}"
  pub-cidr-block             = var.pub-cidr-block
  pub-sub-name               = "${local.env}-${local.org}-${var.pub-sub-name}"
  pri-cidr-block             = var.pri-cidr-block
  pri-sub-name               = "${local.env}-${local.org}-${var.pri-sub-name}"
  public-rt-name             = "${local.env}-${local.org}-${var.public-rt-name}"
  private-rt-name            = "${local.env}-${local.org}-${var.private-rt-name}"
  gke-egress-fw-rule         = var.gke-egress-fw-rule
  gke-ingress-fw-rule        = var.gke-ingress-fw-rule
  ondemand_instance_types    = var.ondemand_instance_types
  spot_instance_types        = var.spot_instance_types
  desired_capacity_on_demand = var.desired_capacity_on_demand
  min_capacity_on_demand     = var.min_capacity_on_demand
  max_capacity_on_demand     = var.max_capacity_on_demand
  desired_capacity_spot      = var.desired_capacity_spot
  min_capacity_spot          = var.min_capacity_spot
  max_capacity_spot          = var.max_capacity_spot
  cluster-version            = var.cluster-version
  endpoint-private-access    = var.endpoint-private-access
  endpoint-public-access     = var.endpoint-public-access
}