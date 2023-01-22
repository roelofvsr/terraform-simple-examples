<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_null"></a> [null](#provider\_null) | 3.2.1 |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [null_resource.multi-state](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.multi-state-read-back-in](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [terraform_remote_state.project-2](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_output-project-1"></a> [output-project-1](#input\_output-project-1) | n/a | `string` | `"value defined in project-1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_output-project-1"></a> [output-project-1](#output\_output-project-1) | n/a |
<!-- END_TF_DOCS -->