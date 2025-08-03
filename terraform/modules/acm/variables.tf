variable "domain_name" {
  type = string
}

variable "validation_method" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "route53_domain_zone_id" {
  type = string
}

variable "dns_ttl" {
  type = number
}

variable "allow_overwrite" {
  type    = bool
  default = true
}
