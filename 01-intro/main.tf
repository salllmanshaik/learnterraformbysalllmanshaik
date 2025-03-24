#Now suppose I want to create a local file, I will make use of local_file resource. Lets see

resource "local_file" "first" {
  content  = "Welcome to learning terraform by sallman"
  filename = "${path.module}/first.bar"
}

