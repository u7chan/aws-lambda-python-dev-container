#!/bin/sh

if [ -z "$1" ]
then
    echo "Usage:"
    echo "  delete_function [lambda-function-name]"
    echo ""
    exit 0
fi

LAMBDA_FUNCTION_NAME=$1

docker run --rm -it -v ~/.aws:/root/.aws -v $(pwd):/aws amazon/aws-cli \
  lambda delete-function --function-name $LAMBDA_FUNCTION_NAME