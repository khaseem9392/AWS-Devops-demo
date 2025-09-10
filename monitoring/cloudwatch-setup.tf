
resource "aws_cloudwatch_log_group" "app_logs" {
  name              = "/aws/sample-app"
  retention_in_days = 14
}
