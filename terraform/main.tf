locals {
    prefix = "ce-serverless"
    image  = "srodi/go_http:latest"
}
resource "ibm_resource_group" "resource_group" {
  name = "${local.prefix}-resource-group"
}

resource "ibm_code_engine_project" "code_engine_project_instance" {
  name              = "${local.prefix}-project"
  resource_group_id = ibm_resource_group.resource_group.id
}

resource "ibm_code_engine_app" "code_engine_app_instance" {
  project_id      = ibm_code_engine_project.code_engine_project_instance.project_id
  name            = "${local.prefix}-app"
  image_reference = local.image
}

output "app_url" {
  value = ibm_code_engine_app.code_engine_app_instance.href
}
