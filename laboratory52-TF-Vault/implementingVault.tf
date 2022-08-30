
data "vault_generic_secret" "demo" {
  path = "secret/db-creds"
}
output "vault_secrets" {
    value = data.vault_generic_secret.demo.data_json
    sensitive = true
}
