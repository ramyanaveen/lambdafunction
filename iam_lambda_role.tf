resource "aws_iam_role_policy" "lambda_policy" {
  name = "lambda_policy"
  role = aws_iam_role.lambda_role.id
  policy = "${file("iam/iam_role_policy.json")}"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.

}

resource "aws_iam_role" "lambda_role" {
  name = "lambda_role"

  assume_role_policy = "${file("iam/iam_assume_policy.json")}"
}