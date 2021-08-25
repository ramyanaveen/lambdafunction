data "archive_file" "startandstopinstances" {
    type        = "zip"
    source_file = "startandstopInstances.py"
    output_path = "startandstop.zip"
}



resource "aws_lambda_function" "startandstop" {
    filename        = "startandstop.zip"
    function_name   = "startandstopfunction"
    role            =  aws_iam_role.lambda_role.arn
    handler         = "startandstopInstances.startandstopinstances"
    source_code_hash = filebase64sha256("startandstop.zip")
    runtime         = "python3.7"
}