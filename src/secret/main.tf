module "secret" {
  source = "../../modules/secret"

  kms_info = {
    key_ring   = "test"
    crypto_key = "bestpractice-sample"
  }

  ciphertext = "CiQA3KEfa06yazAYoXGyuX0ZRX4MjluESCBTQPWhEgRzeK4HB3ASLQCk29aHH/XgLZDZTGAVOGyQ
pveN33SWVlGTY6qMqIiFATkCGYOZpSgbHv5Y7A=="
}
