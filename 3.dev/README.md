## Development
1. [Workspaces](#workspaces)
2. [Remote-modules](#remote-modules)
3. [Codetours](#codetours)
4. [Pre-commit](#pre-commit)
5. [ci-cd](#ci-cd)
<br></br>


### Workspaces
As mentioned before, workspaces are not a good way to have strong separation of state.
However for small projects, or for a separate development environment it can be convenient. 

The key is to have all relevant named resources be created using the `workspace` variable. 
If this is not in place you will get a lot of 'resource already exists' errors when you switch environments.

See [here](./1.workspaces/conditional.tf) for an example.
<br></br>


### Remote-modules
Remote modules can slow down development, but can be a good way to share code between projects.

Use them when they make sense, and make sure they are not neither too complex nor not flexible enough to handle complex use cases.

See [here](./2.remote-modules/main.tf) for an example.

For info see [terraform documentation](https://developer.hashicorp.com/terraform/language/modules/sources)
<br></br>


### Codetours
Code tours is not a terraform specific tool, but it works great for pointing to references to for example update variables in multiple places. 

Make sure there are a couple of simple code tours available to make it easy for a new developer to make sense of the code.

Codetours produces a simple JSON file, IDE's like VScode and Pycharm have extensions to read this file and show the tour in the editor.

Install from here: https://marketplace.visualstudio.com/items?itemName=vsls-contrib.codetour

Once you have it installed: open command pallet: `ctrl+shift+p` and type `codetour` and select `Codetour: Open Tour File...`

Select the "example-1-workspaces.tour" file that is present in the Codetour folder [here](./4.codetours/example-1-workspaces.tour)

This will guide you to the workspaces folder and walk you through the file. 

You can also record your own tour using the same steps but select `Codetour: Record Tour`

Also be aware that you can point to any file in the repo, so you can jump from folder to folder and provide clear context for different use-cases.

Lastly you can associate a our with a specific branch, so that you can have a tour for a specific version of the code.

See [here](./4.codetours/example-2-remote-modules.tour) for an example
<br></br>


### Pre-commit
In order to capitalise on the left-shift paradigm pre-commit is a very good tool. It enables developers to clean code as much as possible locally, and it can be paired with a ci-cd pipeline that will enforce the same rules.

[This](https://github.com/antonbabenko/pre-commit-terraform) is a good starting point. A simplified getting started:
- install pre-commit 
    - mac: `brew install pre-commit`
    - windows: `pip install pre-commit` (make sure it is on path, find with `where python -m pre-commit`, but also take note of the 'Scripts' folder, which is located inside the python distribution, for example: "C:\ProgramData\Miniconda3\Scripts\pre-commit.exe"), for clean deployment use Windows Subsystem for Linux or a python virtual env.
- make sure `.pre-commit-config.yaml` is in the root of the project
- run `pre-commit install` in the root of the project
- run `pre-commit run --all-files` to run all checks on all files

See [here](./3.pre-commit/.pre-commit-config.yaml) for an example
<br></br>


### ci-cd
For ci-cd see the examples mentioned in [2.state](../2.state/README.md)
