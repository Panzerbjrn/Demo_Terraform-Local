output "nested_map-1" {
  value = var.nested_map["map1"]["key1"]
}

output "tf_map-1" {
  value = var.tf_map["dev"]["us"]
}

output "tf_map-2" {
  value = var.tf_map["qa"]["uk"]
}

