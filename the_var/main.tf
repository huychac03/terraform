locals {
  var_file = {
    "1": local.file_1,
    "2": local.file_1
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

