#Now suppose I want to create a local file, I will make use of  local provider and local_file resource. Lets see
provider local {}


resource "local_file" "first" {
  content  = "Welcome to learning terraform by sallman"
  filename = "/tmp/first.bar"
}

# Normal Variable
variable "x" {
  default = 10
}


# List variable
variable "y" {
  default = [ 1, "abc", 0.3, false]
}

# list can have a combination of types also
variable "z" {
  default = {
    name = "JOhn"
    age = 20
  }
}

## Print variable on output
output "x" {
  value = var.x
}

# if our value is just variable then var.x , if it is combination of strings then "${var.x}"
output "x1" {
  value = "Value of x - ${var.x}"
}


output "y1" {
  value = var.y[0] #This will print "y1=1"
}

output "z" {
  value = "Name - ${var.z["name"]}, Age - ${var.z.age}" #This will print "Name - John, Age - 20".
}




#### Variables from another files

# tfvars - manually loaded, Meaning these files are loaded to command line by using -var-file option
# terraform apply -auto-approve -var-file=data.tfvars

variable "input" {}  #The input will be picked from data.tfvars

output "input" {
  value = var.input
}


# auto.tfvars - Automatically these files are loaded
variable "class" {}
output "class" {
  value = var.class #This will print value of class given in class.auto.tfvars[the naming is given for understanding only it can be anything with auto.tfvars]
}

variable "trainer" {}

output "trainer" {
  value = var.trainer #This will print value of trainer given in trainer.auto.tfvars[the naming is given for understanding only it can be anything with auto.tfvars]
}