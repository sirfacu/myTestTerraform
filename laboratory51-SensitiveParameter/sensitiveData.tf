locals {
  db_password = {
    admin = file("./db_password")
  }
}

output "db_password" {
    value = local.db_password
    sensitive = true
}

/* The main idea to use sensitive = true is to don't show the sensitive data on plain text it let us to obfuscated the value
 */