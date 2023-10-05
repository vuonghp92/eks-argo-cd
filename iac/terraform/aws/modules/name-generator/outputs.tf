output "name" {
  value = "${lower(replace(var.name, "/^(.+)\\-$/", "$1"))}-${replace(replace(lower(random_id.id.b64_url), "_", ""), "-", "")}"
}
