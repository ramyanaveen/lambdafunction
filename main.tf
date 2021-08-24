data "archive_file" "startandstopinstances" {
    type        = "zip"
    source_file = "startandstopInstances.py"
    output_path = "output/startandstopInstances.zip"
}



resource "aws_lambda_function" "startandstopfunc" {
    filename        = "output/startandstopInstances.zip"
    function_name   = "startandstopfunc"
    role            = "aws_iam_role.lambda_role.arn"
    handler         = "startandstopInstances.startandstopinstances"

    runtime         = "python3.7"
}