module "lambda" {
 source="../modules/lambda" 
 function_name = var.function_name
}