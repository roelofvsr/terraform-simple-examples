<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_local"></a> [local](#provider\_local) | 2.3.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_conditional-1"></a> [conditional-1](#module\_conditional-1) | ./modules/conditional | n/a |
| <a name="module_conditional-2"></a> [conditional-2](#module\_conditional-2) | ./modules/conditional | n/a |
| <a name="module_module-output"></a> [module-output](#module\_module-output) | ./modules/output | n/a |

## Resources

| Name | Type |
|------|------|
| [local_file.foo](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_name"></a> [name](#output\_name) | this is the output of the module define here that uses the input from the 'modul-output' module |
<!-- END_TF_DOCS -->