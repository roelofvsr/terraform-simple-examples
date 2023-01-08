## Development
1. [Workspaces](#workspaces)
2. [Remote-modules](#remote-modules)
3. [Codetours](#Codetours)
4. [Pre-commit](#pre-commit)
5. [ci-cd](#ci-cd)
<br></br>


### Workspaces
As mentioned before, workspaces are not a good way to have string separation of state.
However for small projects, or for a seprate development environment it can be convenient. 

Key here is to have all relevant named resources be associated with the `workspace` variable. 
If this is no in place you will get a lot of 'resource already exists' errors. once you switch environments.    
<br></br>


### Remote-modules
Remote modules can slow down development, but can be a good way to share code between projects.

Use them when they make sense, and make sure they are not either too complex or not flexible enough to handle complex use cases.
<br></br>


### Codetours
Code tours is not a terraform specific tool, but it works great for pointing to references to variables in multiple places. 

Make sure there are a couple of simple code tours avaialable to make it easy for a new developer to make sense of the code.

Codetours produces a simple JSON file, IDE's like VScode and Pycharm have extensions to read this file and show the tour in the editor.
<br></br>


### Pre-commit
Capitalize on the left-shift paradigm. Enable developers to clean code as much as possible locally, and enforce the same rules in the ci-cd pipeline. 

[This](https://github.com/antonbabenko/pre-commit-terraform) is a good starting point. A simplified getting started:
- install pre-commit 
    - mac: `brew install pre-commit`
    - windows: `pip install pre-commit` (make sure it is on path, find with `where python -m pre-commit`, but also take note of the 'Scripts' folder, which is located inside the python distribution, for example: "C:\ProgramData\Miniconda3\Scripts\pre-commit.exe")
- make sure `.pre-commit-config.yaml` is in the root of the project
- run `pre-commit install` in the root of the project
- run `pre-commit run --all-files` to run all checks on all files
<br></br>


### ci-cd
For ci-cd see the examples mentioned in [2.state](../2.state/README.md)
