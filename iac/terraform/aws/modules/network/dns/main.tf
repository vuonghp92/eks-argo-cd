resource "aws_route53_zone" "main" {
  name = var.internal_domain
  vpc {
    vpc_id = var.vpc_id
  }

  comment = local.description

  tags = merge(
    var.tags,
    {
      Name = "${var.name} DNS Zone"
    },
  )

  lifecycle {
    ignore_changes = [vpc]
  }
}
