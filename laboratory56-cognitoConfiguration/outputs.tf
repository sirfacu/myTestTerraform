output "id" {
  description = "El ID del user pool"
  value       = var.enabled ? aws_cognito_user_pool.pool[0].id : null
}

output "arn" {
  description = "El ARN del pool de usuarios."
  value       = var.enabled ? aws_cognito_user_pool.pool[0].arn : null
}

output "endpoint" {
  description = "El nombre del endpoint name del pool de usuarios. Formato de ejemplo: cognito-idp.REGION.amazonaws.com/xxxx_yyyyy"
  value       = var.enabled ? aws_cognito_user_pool.pool[0].endpoint : null
}

output "creation_date" {
  description = "La fecha de creacion del pool de usuarios"
  value       = var.enabled ? aws_cognito_user_pool.pool[0].creation_date : null
}

output "last_modified_date" {
  description = "La ultima fecha de modificacion del pool de usuarios"
  value       = var.enabled ? aws_cognito_user_pool.pool[0].last_modified_date : null
}

#
# aws_cognito_user_pool_domain
#
output "domain_aws_account_id" {
  description = "El ID de la cuenta AWS para el propietario del user pool"
  value       = var.enabled ? join("", aws_cognito_user_pool_domain.domain.*.aws_account_id) : null
}

output "domain_cloudfront_distribution_arn" {
  description = "El ARN de la distribucion de cloudfront"
  value       = var.enabled ? join("", aws_cognito_user_pool_domain.domain.*.cloudfront_distribution_arn) : null
}

output "domain_s3_bucket" {
  description = "El bucket S3 estatico donde estan los archivos de la pagina web."
  value       = var.enabled ? join("", aws_cognito_user_pool_domain.domain.*.s3_bucket) : null
}

output "domain_app_version" {
  description = "La version de la APP"
  value       = var.enabled ? join("", aws_cognito_user_pool_domain.domain.*.version) : null
}

#
# aws_cognito_user_pool_client
#
output "client_ids" {
  description = "Los IDs de los clientes del user pool"
  value       = var.enabled ? aws_cognito_user_pool_client.client.*.id : null
}

output "client_secrets" {
  description = "Los cliente secrests de los clientes del pool de usuarios"
  value       = var.enabled ? aws_cognito_user_pool_client.client.*.client_secret : null
  sensitive   = true
}

output "client_ids_map" {
  description = "EL mapa de IDs de los clientes el user pool"
  value       = var.enabled ? { for k, v in aws_cognito_user_pool_client.client : v.name => v.id } : null
}

output "client_secrets_map" {
  description = "El mapa de los client secrets de los clientes del user pool."
  value       = var.enabled ? { for k, v in aws_cognito_user_pool_client.client : v.name => v.client_secret } : null
  sensitive   = true
}

#
# aws_cognito_resource_servers
#
output "resource_servers_scope_identifiers" {
  description = " Una lista de los alcances configurados in el formato identificador/nombre_alcance"
  value       = var.enabled ? aws_cognito_resource_server.resource.*.scope_identifiers : null
}