# aws-lambda-python-dev-container

## Overview

This project is to develop AWS Lambda functions in Python on a remote container.

## Usage

1. Docker daemon must have been started.
1. Install extensions.

   - [ms-vscode-remote.remote-containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)

1. Use the Remote-Containers: <br>Reopen in Container command from the Command Palette (F1, ⇧⌘P).

## Deploy AWS-lambda

- AWS credentials information must have been set up.<br>`~/.aws/credentials`

  ### Create function

  ```
  ./scripts/create_function.sh \
    example-func \
    Projects/src/example/lambda_function.py \
    arn:aws:iam::xxxxxx:role/xxxxxx-role
  ```

  ### Delete function

  ```
  ./scripts/delete_function.sh example-func
  ```

  ### Update function

  ```
  ./scripts/update_function.sh \
    example-func \
    Projects/src/example/lambda_function.py
  ```
