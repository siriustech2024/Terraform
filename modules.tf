module "eks_networking" {
  source     = "./modules/networking"
  cidr_block = var.cidr_block
  project    = var.project
  region     = var.region
  tags       = local.tags
}
