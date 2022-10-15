data "scaleway_account_ssh_key" "this" {
  for_each = local.servers
  name     = each.value.keypair
}
