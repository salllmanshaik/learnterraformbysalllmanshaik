#Now suppose I want to create a local file, I will make use of  local provider and local_file resource. Lets see
provider local {}


resource "local_file" "first" {
  content  = "Welcome to learning terraform by sallman"
  filename = "tmp/first.bar"
}

