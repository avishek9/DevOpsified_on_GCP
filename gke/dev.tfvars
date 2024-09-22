env                   = "dev"
project               = "dummyproject-429106"
region                = "us-central1"
vpc-cidr-block        = "10.16.0.0/16"
vpc-name              = "devopsified-gke-vpc"
pub-subnet-count      = 3
pub-cidr-block        = "10.16.0.0/18"
pub-availability-zone = ["us-central1-a", "us-central1-b", "us-central1-c"]
pub-sub-name          = "subnet-public"
pri-subnet-count      = 3
pri-cidr-block        = "10.0.0.0/16"
sec-pod-cidr-block    = "10.1.0.0/16"
sec-service-cidr-block= "10.2.0.0/20"
pri-availability-zone = ["us-central1-a", "us-central1-b", "us-central1-c"]
pri-sub-name          = "subnet-private"
public-rt-name        = "public-route-table"
private-rt-name       = "private-route-table"
static-ip-name              = "elasticip-ngw"
router-name              = "devopsified-router"
cloud-nat-name =      "devopsified-NAT"
eks-sg                = "eks-sg"

# EKS
is-eks-cluster-enabled     = true
gke-egressf-fw-rule        = "gke-egress-allow-rule"
gke-ingressf-fw-rule        = "gke-ingress-allow-rule"
cluster-version            = "1.29"
cluster-name               = "eks-cluster"
endpoint-private-access    = true
endpoint-public-access     = false
ondemand_instance_types    = ["t3a.medium"]
spot_instance_types        = ["c5a.large", "c5a.xlarge", "m5a.large", "m5a.xlarge", "c5.large", "m5.large", "t3a.large", "t3a.xlarge", "t3a.medium"]
desired_capacity_on_demand = "1"
min_capacity_on_demand     = "1"
max_capacity_on_demand     = "5"
desired_capacity_spot      = "1"
min_capacity_spot          = "1"
max_capacity_spot          = "10"
addons = [
  {
    name    = "vpc-cni",
    version = "v1.18.1-eksbuild.1"
  },
  {
    name    = "coredns"
    version = "v1.11.1-eksbuild.9"
  },
  {
    name    = "kube-proxy"
    version = "v1.29.3-eksbuild.2"
  },
  {
    name    = "aws-ebs-csi-driver"
    version = "v1.30.0-eksbuild.1"
  }
  # Add more addons as needed
]