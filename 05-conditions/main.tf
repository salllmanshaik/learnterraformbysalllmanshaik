resource "local_file" "test" {
  filename = "/tmp/a.txt"
  content = var.content == null ? "Null Content" : var.content
}

variable "content" {
  default = null
}

# condition is all about what value to give to a argument.
# Now we can use this as an advantage and decide whether we can run this resource or not using a count loop

resource "null_resource" "test" {
  count = var.content == null && var.content == "" ? 0 : 1
}


# if [ x = 1 ] ; then
#   x=100
#elsif [ x = 2 ]; then
# x=200
# else
#x=0
#fi

# x = var.x == 1 ? "100" : var.x == 2 ? "200" : 0

variable "x" {
  type = number
}
output "x" {
  value = var.x == 1 ? 100 : (var.x == 2 ? 200 : 0)
}