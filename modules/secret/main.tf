data "google_kms_key_ring" "main" {
  name     = var.kms_info.key_ring
  location = var.location
}

data "google_kms_crypto_key" "main" {
  name     = var.kms_info.crypto_key
  key_ring = data.google_kms_key_ring.main.self_link
}

data "google_kms_secret" "main" {
  crypto_key = data.google_kms_crypto_key.main.self_link
  ciphertext = var.ciphertext
}
