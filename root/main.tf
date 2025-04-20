
module "notification_sqs" {
  source = "../"

  prefix = var.prefix
}

variable "prefix" {
  description = "Prefixo para os nomes das filas"
  type        = string
}
