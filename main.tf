resource "azurerm_resource_group" "resoucegroup" {
  name     = "Demo_Terraform-Local"
  location = var.region_map[var.region]
}