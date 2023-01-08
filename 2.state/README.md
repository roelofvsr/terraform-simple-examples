## State
1. [Multi-state](#multi-state)
2. [Data-terraform-remote-state](#data-terraform-remote-state)
3. [ci-cd](#ci-cd)
<br></br>


### Multi-state
Strong state separation is a good idea. This means that each environment should have its own state file. Workspaces should not be used for this pupose. 

You could use both state files and workspaces, but this this will be more complex to manage.
<br></br>


### Data-terraform-remote-state
The data source `terraform_remote_state` can be convenient, but is also risky. Since statefile exposes secrets, sharing state is a bad idea. The only way that it makes sense is within the same project and you have to communicate variable between projects. 
See [here](./2.data-remote-state/) for an example.

For any other use case, see the terraform recommended alternatives [here](https://developer.hashicorp.com/terraform/language/state/remote-state-data#alternative-ways-to-share-data-between-configurations).
<br></br>


### ci-cd
State separation comes down to separating configurations using the `config` folder with a different `*.tfvars` file per environment and then integrating this with a git branching strategy.

See [here]( ..... ) 
