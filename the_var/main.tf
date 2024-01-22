locals {
  var_file = {
    "1": local.using_existing_resources,
    "2": local.using_existing_resources
  }
}

output "configuration" {
  value = local.var_file["${var.var_file}"]
}

# output "global_variables" {
#   value = local.global_variables
# }

# output "tags" {
#   value = local.tags
# }

