
module "module-output" {
  source = "./modules/output"
}

resource "local_file" "foo" {
  content  = module.module-output.name
  filename = "./foo.bar"
}

output "name" {
  value       = local_file.foo.filename
  description = "this is the output of the module define here that uses the input from the 'module-output' module"
}
