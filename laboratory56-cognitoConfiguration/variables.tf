# Variables de uso general

variable "nombre-proyecto" {}
variable "aws_region" {}
variable "ambiente" {}
variable "tf-version" {}

variable "secret_key" {}
variable "access_key" {}


variable "mce-cognito" {}
variable "zone_id" {}
variable "cloud_front_arn" {}

#
# aws_cognito_user_pool
#
variable "enabled" {
  description = "Cambie a false para evitar desplegar cualquier recursos"
  type        = bool
  default     = true
}

variable "user_pool_name" {
  description = "El nombre del pool de usuarios"
  type        = string
  default     = ""
}

variable "email_verification_message" {
  description = "Una cadena que representa el mensaje de verificacion del correo"
  type        = string
  default     = null
}

variable "email_verification_subject" {
  description = "Una cadena que representa el subject de verificacion del correo"
  type        = string
  default     = null
}

# Configuracion del nombre de usuario
variable "username_configuration" {
  description = "La configuración del nombre de usuario. La configuración de `case_sesiteve` especifica si se aplicará la distinción entre mayúsculas y minúsculas de nombre de usuario para todos los usuarios en el grupo de usuarios a través de las API de Cognito"
  type        = map(any)
  default     = {}
}

# Crear configuracion de usuario administrador
variable "admin_create_user_config" {
  description = "La configuración para las solicitudes de AdminCreateUser"
  type        = map(any)
  default     = {}
}

variable "admin_create_user_config_allow_admin_create_user_only" {
  description = "Establézcalo en true si solo el administrador puede crear perfiles de usuario. Establézcalo en Falso si los usuarios pueden registrarse a través de una aplicación"
  type        = bool
  default     = false
}

variable "temporary_password_validity_days" {
  description = "El límite de caducidad de la cuenta de usuario, en días, después del cual la cuenta ya no se puede utilizar"
  type        = number
  default     = 7
}

variable "admin_create_user_config_email_message" {
  description = "La plantilla de mensaje para mensajes de correo electrónico. Debe contener los marcadores de posición `{username}` y `{####}`, para el nombre de usuario y la contraseña temporal, respectivamente"
  type        = string
  default     = "{username}, su codigo de verificacion es `{####}`"
}


variable "admin_create_user_config_email_subject" {
  description = "La línea de asunto de los mensajes de correo electrónico"
  type        = string
  default     = "Su codigo de verificación"
}

variable "admin_create_user_config_sms_message" {
  description = "- La plantilla de mensaje para mensajes SMS. Debe contener los marcadores de posición `{username}` y `{####}`, para el nombre de usuario y la contraseña temporal, respectivamente"
  type        = string
  default     = "Su nombre de usuario es {username} y la clave temporal es `{####}`"
}

variable "alias_attributes" {
  description = "Atributos admitidos como alias para este grupo de usuarios. Valores posibles: phone_number, email o preferred_username. Conflictos con `username_attributes`"
  type        = list(string)
  default     = null
}

variable "username_attributes" {
  description = "Especifica si las direcciones de correo electrónico o los números de teléfono se pueden especificar como nombres de usuario cuando un usuario se registra. Conflictos con `alias_attributes`"
  type        = list(string)
  default     = null
}

variable "auto_verified_attributes" {
  description = "Los atributos que se van a verificar automáticamente. Valores posibles: email, phone_number"
  type        = list(string)
  default     = []
}

# sms_configuration
variable "sms_configuration" {
  description = "La configuracion SMS"
  type        = map(any)
  default     = {}
}

variable "sms_configuration_external_id" {
  description = "El ID externo utilizado en las relaciones de confianza del rol de IAM"
  type        = string
  default     = ""
}

variable "sms_configuration_sns_caller_arn" {
  description = "El ARN de la persona que llama de Amazon SNS. Este suele ser el rol de IAM que le ha dado a Cognito permiso para asumir"
  type        = string
  default     = ""
}

# device_configuration
variable "device_configuration" {
  description = "La configuración para el seguimiento de dispositivos del grupo de usuarios"
  type        = map(any)
  default     = {}
}

variable "device_configuration_challenge_required_on_new_device" {
  description = "Indica si se requiere un desafío en un dispositivo nuevo. Solo aplicable a un nuevo dispositivo"
  type        = bool
  default     = false
}

variable "device_configuration_device_only_remembered_on_user_prompt" {
  description = "Si es verdadero, un dispositivo solo se recuerda en la solicitud del usuario."
  type        = bool
  default     = false
}

# email_configuration
variable "email_configuration" {
  description = "La configuracion del correo"
  type        = map(any)
  default     = {}
}

variable "email_configuration_configuration_set" {
  description = "El nombre del conjunto de configuración."
  type        = string
  default     = null
}

variable "email_configuration_reply_to_email_address" {
  description = "La direccion de correo REPLY-TO"
  type        = string
  default     = ""
}

variable "email_configuration_source_arn" {
  description = "El ARN de la fuente de correo electrónico"
  type        = string
  default     = ""
}

variable "email_configuration_email_sending_account" {
  description = "Indique a Cognito que use su funcionalidad integrada o Amazon SES para enviar correos electrónicos. Valores permitidos: `COGNITO_DEFAULT` o `DEVELOPER`"
  type        = string
  default     = "COGNITO_DEFAULT"
}

variable "email_configuration_from_email_address" {
  description = "Dirección de correo electrónico del remitente o nombre para mostrar del remitente con su dirección de correo electrónico (por ejemplo, `john@example.com`, `John Smith <john@example.com>` o `\"John Smith Ph.D.\" <john@example.com >)`. Se requieren comillas dobles con escape alrededor de los nombres para mostrar que contienen ciertos caracteres como se especifica en RFC 5322"
  type        = string
  default     = null
}

# lambda_config
variable "lambda_config" {
  description = "Un contenedor para los disparadores de AWS Lambda asociados con el grupo de usuarios"
  type        = any
  default     = {}
}

variable "lambda_config_create_auth_challenge" {
  description = "El ARN de la lambda que crea un desafío de autenticación."
  type        = string
  default     = null
}

variable "lambda_config_custom_message" {
  description = "Un disparador de AWS Lambda de mensaje personalizado."
  type        = string
  default     = null
}

variable "lambda_config_define_auth_challenge" {
  description = "Define el desafío de autenticación."
  type        = string
  default     = null
}

variable "lambda_config_post_authentication" {
  description = "Un disparador de AWS Lambda posterior a la autenticación"
  type        = string
  default     = null
}

variable "lambda_config_post_confirmation" {
  description = "Un disparador de AWS Lambda posterior a la confirmación"
  type        = string
  default     = null
}

variable "lambda_config_pre_authentication" {
  description = "Un activador de AWS Lambda de autenticación previa"
  type        = string
  default     = null
}
variable "lambda_config_pre_sign_up" {
  description = "Un activador de AWS Lambda previo al registro"
  type        = string
  default     = null
}

variable "lambda_config_pre_token_generation" {
  description = "Permitir personalizar los reclamos de tokens de identidad antes de la generación de tokens"
  type        = string
  default     = null
}

variable "lambda_config_user_migration" {
  description = "El tipo de configuración Lambda de migración de usuarios"
  type        = string
  default     = null
}

variable "lambda_config_verify_auth_challenge_response" {
  description = "Verifica la respuesta del desafío de autenticación"
  type        = string
  default     = null
}

variable "lambda_config_kms_key_id" {
  description = "El nombre de recurso de Amazon de las claves maestras del cliente de Key Management Service. Amazon Cognito utiliza la clave para cifrar códigos y contraseñas temporales que se envían a CustomEmailSender y CustomSMSSender."
  type        = string
  default     = null
}

variable "lambda_config_custom_email_sender" {
  description = "A custom email sender AWS Lambda trigger."
  type        = any
  default     = {}
}

variable "lambda_config_custom_sms_sender" {
  description = "A custom SMS sender AWS Lambda trigger."
  type        = any
  default     = {}
}

variable "mfa_configuration" {
  description = "Set to enable multi-factor authentication. Must be one of the following values (ON, OFF, OPTIONAL)"
  type        = string
  default     = "OFF"
}

# software_token_mfa_configuration
variable "software_token_mfa_configuration" {
  description = "Configuration block for software token MFA (multifactor-auth). mfa_configuration must also be enabled for this to work"
  type        = map(any)
  default     = {}
}

variable "software_token_mfa_configuration_enabled" {
  description = "If true, and if mfa_configuration is also enabled, multi-factor authentication by software TOTP generator will be enabled"
  type        = bool
  default     = false
}

# password_policy
variable "password_policy" {
  description = "A container for information about the user pool password policy"
  type = object({
    minimum_length                   = number,
    require_lowercase                = bool,
    require_lowercase                = bool,
    require_numbers                  = bool,
    require_symbols                  = bool,
    require_uppercase                = bool,
    temporary_password_validity_days = number
  })
  default = null
}

variable "password_policy_minimum_length" {
  description = "The minimum length of the password policy that you have set"
  type        = number
  default     = 8
}

variable "password_policy_require_lowercase" {
  description = "Whether you have required users to use at least one lowercase letter in their password"
  type        = bool
  default     = true
}

variable "password_policy_require_numbers" {
  description = "Whether you have required users to use at least one number in their password"
  type        = bool
  default     = true
}

variable "password_policy_require_symbols" {
  description = "Whether you have required users to use at least one symbol in their password"
  type        = bool
  default     = true
}

variable "password_policy_require_uppercase" {
  description = "Whether you have required users to use at least one uppercase letter in their password"
  type        = bool
  default     = true
}

variable "password_policy_temporary_password_validity_days" {
  description = "The minimum length of the password policy that you have set"
  type        = number
  default     = 7
}

# schema
variable "schemas" {
  description = "A container with the schema attributes of a user pool. Maximum of 50 attributes"
  type        = list(any)
  default     = []
}

variable "string_schemas" {
  description = "A container with the string schema attributes of a user pool. Maximum of 50 attributes"
  type        = list(any)
  default     = []
}

variable "number_schemas" {
  description = "A container with the number schema attributes of a user pool. Maximum of 50 attributes"
  type        = list(any)
  default     = []
}

# sms messages
variable "sms_authentication_message" {
  description = "A string representing the SMS authentication message"
  type        = string
  default     = null
}

variable "sms_verification_message" {
  description = "A string representing the SMS verification message"
  type        = string
  default     = null
}

# tags
variable "tags" {
  description = "A mapping of tags to assign to the User Pool"
  type        = map(string)
  default     = {}
}

# user_pool_add_ons
variable "user_pool_add_ons" {
  description = "Configuration block for user pool add-ons to enable user pool advanced security mode features"
  type        = map(any)
  default     = {}
}

variable "user_pool_add_ons_advanced_security_mode" {
  description = "The mode for advanced security, must be one of `OFF`, `AUDIT` or `ENFORCED`"
  type        = string
  default     = null
}

# verification_message_template
variable "verification_message_template" {
  description = "The verification message templates configuration"
  type        = map(any)
  default     = {}
}

variable "verification_message_template_default_email_option" {
  description = "The default email option. Must be either `CONFIRM_WITH_CODE` or `CONFIRM_WITH_LINK`. Defaults to `CONFIRM_WITH_CODE`"
  type        = string
  default     = null
}

variable "verification_message_template_email_message_by_link" {
  description = "The email message template for sending a confirmation link to the user, it must contain the `{##Click Here##}` placeholder"
  type        = string
  default     = null
}

variable "verification_message_template_email_subject_by_link" {
  description = "The subject line for the email message template for sending a confirmation link to the user"
  type        = string
  default     = null
}

#
# aws_cognito_user_pool_domain
#
variable "domain" {
  description = "Cognito User Pool domain"
  type        = string
  default     = null
}

variable "domain_certificate_arn" {
  description = "The ARN of an ISSUED ACM certificate in us-east-1 for a custom domain"
  type        = string
  default     = null
}

#
# aws_cognito_user_pool_client
#
variable "clients" {
  description = "A container with the clients definitions"
  type        = any
  default     = []
}

variable "client_allowed_oauth_flows" {
  description = "The name of the application client"
  type        = list(string)
  default     = ["code"]
}

variable "client_allowed_oauth_flows_user_pool_client" {
  description = "Whether the client is allowed to follow the OAuth protocol when interacting with Cognito user pools"
  type        = bool
  default     = true
}

variable "client_allowed_oauth_scopes" {
  description = "List of allowed OAuth scopes (phone, email, openid, profile, and aws.cognito.signin.user.admin)"
  type        = list(string)
  default     = ["phone", "email", "openid"]
}

variable "client_callback_urls" {
  description = "List of allowed callback URLs for the identity providers"
  type        = list(string)
  default     = [".html"]
}

variable "client_default_redirect_uri" {
  description = "The default redirect URI. Must be in the list of callback URLs"
  type        = string
  default     = ".html"
}

variable "client_enable_token_revocation" {
  description = "Whether the client token can be revoked"
  type        = bool
  default     = true
}

variable "client_explicit_auth_flows" {
  description = "List of authentication flows (ADMIN_NO_SRP_AUTH, CUSTOM_AUTH_FLOW_ONLY, USER_PASSWORD_AUTH)"
  type        = list(string)
  default     = ["ADMIN_NO_SRP_AUTH"]
}

variable "client_generate_secret" {
  description = "Should an application secret be generated"
  type        = bool
  default     = false
}

variable "client_logout_urls" {
  description = "List of allowed logout URLs for the identity providers"
  type        = list(string)
  default     = ["logged_out.html"]
}

variable "client_name" {
  description = "The name of the application client"
  type        = string
  default     = "mce-client"
}

variable "client_read_attributes" {
  description = "List of user pool attributes the application client can read from"
  type        = list(string)
  default     = []
}

variable "client_prevent_user_existence_errors" {
  description = "Choose which errors and responses are returned by Cognito APIs during authentication, account confirmation, and password recovery when the user does not exist in the user pool. When set to ENABLED and the user does not exist, authentication returns an error indicating either the username or password was incorrect, and account confirmation and password recovery return a response indicating a code was sent to a simulated destination. When set to LEGACY, those APIs will return a UserNotFoundException exception if the user does not exist in the user pool."
  type        = string
  default     = null
}

variable "client_supported_identity_providers" {
  description = "List of provider names for the identity providers that are supported on this client"
  type        = list(string)
  default     = []
}

variable "client_write_attributes" {
  description = "List of user pool attributes the application client can write to"
  type        = list(string)
  default     = []
}

variable "client_access_token_validity" {
  description = "Time limit, between 5 minutes and 1 day, after which the access token is no longer valid and cannot be used. This value will be overridden if you have entered a value in `token_validity_units`."
  type        = number
  default     = 60
}

variable "client_id_token_validity" {
  description = "Time limit, between 5 minutes and 1 day, after which the ID token is no longer valid and cannot be used. Must be between 5 minutes and 1 day. Cannot be greater than refresh token expiration. This value will be overridden if you have entered a value in `token_validity_units`."
  type        = number
  default     = 60
}

variable "client_refresh_token_validity" {
  description = "The time limit in days refresh tokens are valid for. Must be between 60 minutes and 3650 days. This value will be overridden if you have entered a value in `token_validity_units`"
  type        = number
  default     = 30
}

variable "client_token_validity_units" {
  description = "Configuration block for units in which the validity times are represented in. Valid values for the following arguments are: `seconds`, `minutes`, `hours` or `days`."
  type        = any
  default = {
    access_token  = "minutes"
    id_token      = "minutes"
    refresh_token = "days"
  }

}

#
# aws_cognito_user_group
#
variable "user_groups" {
  description = "A container with the user_groups definitions"
  type        = list(any)
  default     = []
}

variable "user_group_name" {
  description = "The name of the user group"
  type        = string
  default     = null
}

variable "user_group_description" {
  description = "The description of the user group"
  type        = string
  default     = null
}

variable "user_group_precedence" {
  description = "The precedence of the user group"
  type        = number
  default     = null
}

variable "user_group_role_arn" {
  description = "The ARN of the IAM role to be associated with the user group"
  type        = string
  default     = null
}

#
# aws_cognito_resource_server
#
variable "resource_servers" {
  description = "A container with the user_groups definitions"
  type        = list(any)
  default     = []
}

variable "resource_server_name" {
  description = "A name for the resource server"
  type        = string
  default     = null
}

variable "resource_server_identifier" {
  description = "An identifier for the resource server"
  type        = string
  default     = null
}

variable "resource_server_scope_name" {
  description = "The scope name"
  type        = string
  default     = null
}

variable "resource_server_scope_description" {
  description = "The scope description"
  type        = string
  default     = null
}

#
# Account Recovery Setting
#
variable "recovery_mechanisms" {
  description = "The list of Account Recovery Options"
  type        = list(any)
  default     = []
}

#
# aws_cognito_identity_provider
#
variable "identity_providers" {
  description = "Cognito Pool Identity Providers"
  type        = list(any)
  default     = []
}
variable "main_domain" {
  type = string
  default = ""
}