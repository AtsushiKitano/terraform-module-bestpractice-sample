variable "vpc" {
  type = object({
    name = string
    cidr = string
  })
}

variable "subnets" {
  type = list(object({
    name     = string
    cidr     = string
    location = string
  }))
}

variable "project" {
  type = string
}
