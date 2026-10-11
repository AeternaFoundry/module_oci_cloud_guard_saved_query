resource "oci_cloud_guard_saved_query" "cloud_guard_saved_queries" {
  for_each = var.cloud_guard_saved_queries

  compartment_id = each.value.compartment_id
  display_name   = each.value.display_name
  query          = each.value.query
  defined_tags   = each.value.defined_tags
  description    = each.value.description
  freeform_tags  = each.value.freeform_tags

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

