locals {
  ecr_repos = [
    "api",
    "migration",
  ]
}

resource "aws_ecr_repository" "this" {
  for_each             = toset(local.ecr_repos)
  name                 = "${each.value}"
  image_tag_mutability = "IMMUTABLE"
  tags                 = local.common_tags
}

resource "aws_ecr_lifecycle_policy" "this" {
  for_each = toset(local.ecr_repos)

  policy = jsonencode(
    {
      rules = [
        {
          action = {
            type = "expire"
          }
          description  = "Expire excess images more than 50"
          rulePriority = 1
          selection = {
            countNumber = 100
            countType   = "imageCountMoreThan"
            tagStatus   = "any"
          }
        },
      ]
    }
  )
  repository = aws_ecr_repository.this[each.key].name
}
