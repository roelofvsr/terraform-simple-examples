## Testing
1. [Validating-variables](#validating-variables)
2. [Testing-terratest](#testing-terratest)
3. [ci-cd](#ci-cd)
<br></br>


### Validating-variables
A lot can be achieved using validation inside `variables.tf`

A second pattern can be that of a validation module, see for more info [here](https://github.com/hashicorp/terraform/issues/25422#issuecomment-651414257)

See [here](./1.validating-variables/main.tf) for an example.
<br></br>


### Testing-terratest
#### Intro
In order to test we use terratest, from gruntwork. Gruntwork can also be implemented fully in order to keep code DRY, but for this example only terratest is used

#### Getting started
Make sure go is installed: [Go](https://golang.org/) >= 1.17
(Make sure terraform is installed as well)

##### Initiate the tests
```
# cd "<repo path>/terraform-examples/4.testing/2.testing-terratest/test_module_<module-name>"
go mod init terra_config 
go mod tidy
```

Note that these tests run with local state.

##### Run the tests
go to the folder with `.go` scripts (2.testing-terratest/test_module_<module-name>)

`go test -v -timeout 30m`

Note: if you are logged into you personal account on azure in your terminal Terratest will make use of these credentials and deploy there:
handy for testing since it also destroys: but be aware if you are testing something large, expensive or something that needs a specific Cloud environment.

##### Unit tests
The standard test triangle consists of unit tests (most number of tests), integration tests (less number of tests) and end to end tests (least number of tests, but most important).
Start with unit tests: you can create a folder with the name of a module and simply create a `main.tf` that calls the module with some basic parameters. The test can then init, apply and destroy the module, which is a good test and can be considered a unit test.

See [here](./2.testing-terratest/test_module_hello_world/module_hello_world_test.go) for an example.
<br></br>


### ci-cd
A way to automate these tests is shown in the shell script that simply loops over the test folders and executes the commands listed above. 
The downside of this is that all tests will always run even if there are no changes in the module.

For more ci-cd patterns see: [here](../2.state/3.ci-cd/)
