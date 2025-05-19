variable "name" {
  type = string
  description = "Policy name"
}

variable "description" {
  type = string
  description = "Policy description"
}

variable "rules" {
  type = set(object({
    path = string
    capabilities = list(string)
    description = string
  }))
}
