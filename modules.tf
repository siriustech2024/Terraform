module "eks_networking" {
  source     = "./modules/networking"
  cidr_block = var.cidr_block
  project    = var.project
  region     = var.region
  tags       = local.tags
}

module "eks_cluster" {
  source        = "./modules/cluster"
  project       = var.project
  tags          = local.tags
  subnet_pub_1a = module.eks_networking.subnet_pub_1a
  subnet_pub_1b = module.eks_networking.subnet_pub_1b
}