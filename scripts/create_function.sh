#!/bin/sh

if [ -z "$1" -o -z "$2" -o -z "$3" ]
then
    echo "Usage:"
    echo "  create_function [lambda-function-name] [deploy-source-path] [lambda-function-role]"
    echo ""
    exit 0
fi

LAMBDA_FUNCTION_NAME=$1
DEPLOY_SOURCE_PATH=$2
LAMBDA_FUNCTION_ROLE=$3

RUNTIME_PYTHON_VERSION=python3.9
DEPLOY_ZIP_FILE=lambda.zip

zip -j -r $DEPLOY_ZIP_FILE $DEPLOY_SOURCE_PATH

docker run --rm -it -v ~/.aws:/root/.aws -v $(pwd):/aws amazon/aws-cli \
  lambda create-function --function-name $LAMBDA_FUNCTION_NAME \
    --role $LAMBDA_FUNCTION_ROLE \
    --zip-file fileb://$DEPLOY_ZIP_FILE \
    --runtime $RUNTIME_PYTHON_VERSION \
    --handler lambda_function.lambda_handler

rm $DEPLOY_ZIP_FILE