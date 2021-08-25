resource "aws_cloudwatch_event_rule" "tostartinstances"{
    name                 = "crontostartinstances"
    description          = "to start ip"
    schedule_expression  = "rate(1 minute)"
}

resource "aws_cloudwatch_event_target" "ec2instancestarget"{
    rule                 = "aws_cloudwatch_event_rule.tostartinstances.crontostartinstances"
    target_id            = "startstoppedinstances"
    arn                  = aws_lambda_function.startandstop.arn
}

resource "aws_lambda_permission" "allow_cloudwatch"{
    statement_id          = "allowexecutionfromcloudwatchevent"
    action               = "lambda.InvokeFunction"
    function_name        = aws_lambda_function.startandstop.function_name
    principal            = "events.amazonaws.com"
    source_arn           = aws_cloudwatch_event_rule.tostartinstances.arn
}