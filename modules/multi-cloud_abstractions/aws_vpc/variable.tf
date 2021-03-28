variable "vpc" {
  type = object({
    name = string
    cidr = string
  })
}

variable "subnets" {
  type = list(object({
    cidr     = string
    name     = string
    location = string
  }))
}

variable "project" {
  type = string
}
