variable "object_data" {
  type = object({
    name = string
    age = number
    city = string
    size = list(number)
  })
  default = {
    name = "loki"
    age = 26
    city = "Naganahalli"
    size = [ 42, 34 ]
  }
}