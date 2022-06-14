#!/bin/sh

if [ -z "$1"  -o  -z "$2" ]
then
    echo "Usage:"
    echo " update_function [lambda-function-name] [deploy-source-path]"
    echo ""
    exit 0
fi

LAMBDA_FUNCTION_NAME=$1
DEPLOY_SOURCE_PATH=$2

DEPLOY_ZIP_FILE=lambda.zip

zip -j -r $DEPLOY_ZIP_FILE $DEPLOY_SOURCE_PATH

docker run --rm -it -v ~/.aws:/root/.aws -v $(pwd):/aws amazon/aws-cli \
  lambda update-function-code --function-name $LAMBDA_FUNCTION_NAME \
    --zip-file fileb://$DEPLOY_ZIP_FILE

rm $DEPLOY_ZIP_FILE