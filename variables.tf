/* REQUIRED -------------------------------------*/

variable "cloudflare_token" {
  description = "Token for interacting with Cloudflare API."
}

variable "cloudflare_email" {
  description = "Email address of Cloudflare account."
}

/* DNS Zones -----------------------------------*/

variable "zones" {
  description = "CloudFlare DNS entries"
  default     = {
    "embark.team"   = "54c28208fb9d495c45fa1ec0716721d6",
    "embarklabs.io" = "a47f1f1a185d0dc8d6db1aa6a6d4415c",
  }
}
