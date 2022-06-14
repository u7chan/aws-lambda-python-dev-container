import datetime


# pylint: disable=unused-argument
def lambda_handler(event, context):
    print(f'current date: {datetime.datetime.now()}')
