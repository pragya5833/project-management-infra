# Archive lambda function
data "archive_file" "lambda" {
  type        = "zip"
  source_file = "/Users/pragyabharti/Documents/BITS_Assignments/sem4/outline/Implementation/project-management-backend-lambda/Archive.zip"
  output_path = "lambda_function_payload.zip"
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

