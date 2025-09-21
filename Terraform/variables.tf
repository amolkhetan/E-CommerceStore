variable "region" {
  description = "AWS Region"
  type = string
  default = "us-west-2"
}

variable "key_name" {
  default = "Amol-EC2" 
}

variable "ami_id" {
  default = "ami-03aa99ddf5498ceb9" 
}

variable "instance_type" {
  default = "t2.micro" 
}