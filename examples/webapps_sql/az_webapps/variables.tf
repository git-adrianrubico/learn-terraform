variable "rg-name" {
  type = string
}

variable "azregion" {
  type    = string
}

variable "webapp-name" {
  type = string
  default = "mywebapp-test"
}

variable "sql_fqdn" {
  type = string
}

variable "sql_db_name" {
  type = string
}

variable "sql_admin_user" {
  type = string
}

variable "sql_admin_pass" {
  type      = string
  sensitive = true
}
