resource "aws_security_group_rule" "cluster_sg_rule" {

  # Para permitir o acesso à API do Kubernetes de qualquer origem

  type      = "ingress"
  from_port = 443
  to_port   = 443
  protocol  = "tcp"
  cidr_blocks = [
    "0.0.0.0/0"
  ]
  security_group_id = aws_eks_cluster.eks_cluster.vpc_config[0].cluster_security_group_id
}