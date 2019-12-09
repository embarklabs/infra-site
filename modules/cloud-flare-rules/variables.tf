variable "redirects" {
  description = "List of redirect entries to create as page rules."
  type        = list(object({
    zone = string
    dest = string
    fqdn = string
    url  = string
    /* path   = string */
  }))
}
