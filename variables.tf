variable "location" {
    type = string
    description = "Variable for our resource group"
}

variable "resource_group_name" {
    type = string
    description = "name of resource group"
}

variable "imagebuild" {
    type = string
    description = "version of docker image"
}
