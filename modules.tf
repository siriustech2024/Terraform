module "eks_module" {
  source = "./modules/networking"
  cidr_block = var.cidr_block
  project = var.project
  region = var.region
}
