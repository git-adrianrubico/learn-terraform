variable "rg-name" {
  type = string
  default = "rg-example"
}

variable "azregion" {
  type    = string
  default = "eastus"
}

variable "sql_server_name" {
  type = string
  default = "azsqlsvr-test01"
}

variable "sql_db_name" {
  type = string
  default = "dbtest-01"
}

variable "sql_admin_login" {
  type = string
  default = "sqladmin"
}

variable "sql_admin_password" {
  type = string
  sensitive = true
}