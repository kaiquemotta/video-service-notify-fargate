
resource "aws_sqs_queue" "notification_dlq" {
  name                      = "${var.prefix}-notification-dlq"
  message_retention_seconds = 1209600 # 14 dias
}

resource "aws_sqs_queue" "notification_queue" {
  name                      = "${var.prefix}-notification-queue"
  message_retention_seconds = 345600
  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.notification_dlq.arn
    maxReceiveCount     = 5
  })
}

output "notification_queue_url" {
  value = aws_sqs_queue.notification_queue.id
}

output "notification_queue_arn" {
  value = aws_sqs_queue.notification_queue.arn
}

output "notification_dlq_arn" {
  value = aws_sqs_queue.notification_dlq.arn
}
