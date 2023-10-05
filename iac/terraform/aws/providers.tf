provider "aws" {
  region = var.region
  shared_credentials_file = "$HOME/.aws/credentials"
}

provider "kubernetes" {
  host                   = module.eks.eks_cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks.cluster_ca_certificate)
  token                  = module.eks.cluster_token
}
