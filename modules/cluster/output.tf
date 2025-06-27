output "eks_vpc_config" {

  # A chave abaixo é composta pelo tipo_do_recurso.nome_do_recurso.argumento_ou_propriedade
  # https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_cluster#vpc_config-arguments

  value = aws_eks_cluster.eks_cluster.vpc_config
}