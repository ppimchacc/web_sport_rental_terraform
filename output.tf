output "web_urls" {
  description = "URLs for accessing different roles in the sports rental Web Application"

  value = {
    customer   = "http://${aws_instance.web.public_ip}/customer/frontend/login.html"
    staff      = "http://${aws_instance.web.public_ip}/staff/frontend/login.html"
  }
}
