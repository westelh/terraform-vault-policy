data "vault_policy_document" "main" {
  dynamic "rule" {
    for_each = var.rules
    content {
      path = rule.value.path
      capabilities = rule.value.capabilities
      description = rule.value.description
    }
  }
}

resource "vault_policy" "main" {
  name = var.name
  policy = join("\n",[
    "# ${var.description}",
    data.vault_policy_document.main.hcl]
  )
}
