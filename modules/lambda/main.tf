resource "aws_iam_role" "iam_for_lambda" {
  name               = "iam_for_lambdafn"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_lambda_function" "projectmanagementbe" {
  # If the file is not in the current working directory you will need to include a
  # path.module in the filename.
  filename      = "/Users/pragyabharti/Documents/BITS_Assignments/sem4/outline/Implementation/project-management-backend-lambda/Archive.zip"
  function_name = var.function_name
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "server.handler"
  timeout=  "300"

  source_code_hash = data.archive_file.lambda.output_base64sha256

  runtime = "nodejs18.x"

  environment {
    variables = {
      OPENAI_API_KEY = "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"
    }
  }
}

resource "aws_lambda_function_url" "projectmanagementbe" {
  function_name      = aws_lambda_function.projectmanagementbe.function_name
  authorization_type = "NONE"
}