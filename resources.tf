locals {
  prefix = "CICD"  
  queue_prefix = "Q"
  wuc_prefix = "WUC"
  lobs = ["Sales","Support","Info","New_Customers","Even_Newer_Customers"]

}

resource "genesyscloud_routing_wrapupcode" "ref_wucs" {
  count = length(local.lobs)
  name = format("%s_%s_%s",local.wuc_prefix,local.prefix,local.lobs[count.index])
}

resource "genesyscloud_routing_queue" "ref_queues" {
    count = length(local.lobs)
    name = format("%s_%s_%s",local.queue_prefix,local.prefix,local.lobs[count.index])
    acw_timeout_ms = 30000
    wrapup_codes = [
        for wuc in genesyscloud_routing_wrapupcode.ref_wucs:
            wuc.id
    ]
}

