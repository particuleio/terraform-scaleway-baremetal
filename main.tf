resource "scaleway_baremetal_server" "this" {
  for_each    = local.servers
  zone        = each.value.zone
  offer       = each.value.offer
  os          = each.value.os
  name        = each.value.name
  hostname    = each.key
  ssh_key_ids = [data.scaleway_account_ssh_key.this[each.key].id]
}

output "servers" {
  value = scaleway_baremetal_server.this
}
