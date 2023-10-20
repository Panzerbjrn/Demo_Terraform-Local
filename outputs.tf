output "force_map-1" {
  value = var.force_map["yoda"]
}

output "force_map-2" {
  value = "Yoda is a ${var.force_map["yoda"]}"
}

output "nested_map-1" {
  value = var.nested_map["map1"]["key1"]
}

output "tf_map-1" {
  value = var.tf_map["dev"]["na"]
}

output "tf_map-2" {
  value = var.tf_map["qa"]["uk"]
}

