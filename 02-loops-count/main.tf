resource "null_resource" "dummy" {   #we are using null resource
  count = length(var.x)

  provisioner "local-exec" {
    command = "echo ${var.x[count.index]}"   #This will print for 4 times because we have 4 values in x
  }

}


variable "x" {
  default = [
    1,
    200,
    300,
    400
  ]
}

