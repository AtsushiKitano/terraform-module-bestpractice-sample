variable "kms_info" {
  type = object({
    key_ring   = string
    crypto_key = string
  })
}

variable "ciphertext" {
  type = string
}

variable "location" {
  type    = string
  default = "global"
}
