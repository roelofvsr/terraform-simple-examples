## State
1. [Multi-state](#multi-state)
2. [Data-terraform-remote-state](#data-terraform-remote-state)
3. [ci-cd](#ci-cd)
<br></br>


### Multi-state
Strong state separation is a good idea. This means that each environment should have its own state file. Workspaces should not be used for this purpose. 

You could use both state files and workspaces, but this this will be more complex to manage.

See [here](1.multi-state/main.tf) for an example.
<br></br>


### Data-terraform-remote-state
The data source `terraform_remote_state` can be convenient, but is also risky. Since the state file exposes secrets, sharing state is a bad idea. The only way that it makes sense is within the same project and you have to communicate values between projects. 
See [here](./2.data-remote-state/) for an example.

See [this code tour](../3.dev/4.codetours/example-1-reading-remote-state.tour) for some additional pointers

For any other use case, see the terraform recommended alternatives [here](https://developer.hashicorp.com/terraform/language/state/remote-state-data#alternative-ways-to-share-data-between-configurations).
<br></br>


### ci-cd
ci-cd mostly helps with keeping clean environments and automating the deployment of infrastructure. Separating environments comes down to separating configurations using a `config` folder with a different `*.tfvars` file per environment and setting correct location for remote state. Ideally these variables then integrate with your ci-cd and / or git strategy, for example by using git-flow and associating `dev` branch with dev state, `prod` branch with prod state and possible `feature` branches with feature states.

For setting the remote state it is handy to use backend-config parameters during the terraform init:
```
terraform init \
    -backend-config="storage_account_name=tfstate" \
    -backend-config="container_name=tfstate-bb-azure-databricks-small" \
    -backend-config="resource_group_name=rg-tfstate" \
    -backend-config="key=dev.tfstate"
```
Note: you can also set backend config variables inside the `provider.tf` file. This makes it possible to set for example a standard storage account name, resource group name and state file name inside the provider file and keep the ci-cd cleaner by only providing a storage container name. For example:

```
terraform {
  backend "azurerm" {
    resource_group_name = "rg-tfstate"
    container_name      = "tfstate"
    key                 = "terraform.tfstate"
  }
}
```

For selecting the variable file use the `-var-file` flag
```
terraform init -var-file=config/${{ parameters.environment }}.tfvars
```


For Azure you can also make use of environments which is a build in feature inside Azure Dev/Ops. However, you can only use 'Deployment Jobs' if you want to use an environment, which makes it a bit more complex.


In addition to setting correct state and config files it is handy to have some standard guardrails in place. For example:
- checkov
- tf validate 
- tf plan
- testing

Lastly reporting is important. For compliance, but also for debugging: you want to know what versions of providers you use, which version of code is currently deployed and what the differences between environments are. 

Reporting back:
Use `terraform-docs` to automatically produce a nice markdown/JSON/ASCII output of basic documentation. 

`terraform-docs markdown table --output-file README-test.md .`

Directly publish to your wiki, or slack from your ci-cd pipeline.
This allows users to be confident they know which code is in production and documentation is always automatically up to date without the need for manual updates.

Advantages of automatic updating of documentation according to ChatGPT:
"
Directly publishing documentation from inside a ci-cd pipeline run allows for faster and more efficient updating of documentation, as it eliminates the need for manual intervention. Additionally, it ensures that the documentation is always up to date and consistent with the code, as it is automatically generated and deployed whenever new code is pushed to the repository. This can improve the overall quality of the documentation and make it more accurate and reliable. Additionally, it allows for documentation to be automatically versioned and tagged with the corresponding release which could be beneficial for software development team and stakeholders.
"

See [yaml-example](3.ci-cd/snippets-ci-cd.yaml) [terraform-docs-example-1](2.data-terraform-remote-state/project-1/README-test.md) [terraform-docs-example-2](../1.parameters/4.modules/README-test.md)


Advanced patterns
These examples are basic snippets, but if you want to do ci-cd right you can build multi stage pipelines and use templates to make things easier. 
