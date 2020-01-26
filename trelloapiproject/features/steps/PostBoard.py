from behave import given, when, then, step

from codelogic.SchemaValidator import SchemaValidator
from codelogic.PostBoardRequest import PostBoardRequest

id_value = ""
url_value = ""
name_value = ""
json_response = ""
key_value = ""
token_value = ""


@given('Sets URL "{url}"')
def step_impl(context, url):
    context.postBoard = PostBoardRequest()
    context.validate = SchemaValidator()
    global url_value
    url_value = url


@step('Sets KEY "{key}"')
def step_impl(context, key):
    global key_value
    key_value = key


@step('Sets TOKEN "{token}"')
def step_impl(context, token):
    global token_value
    token_value = token


@given('Sets name "{board_name}"')
def step_impl(context, board_name):
    global name_value
    name_value = board_name


@when("Sends POST request")
def step_impl(context):
    global json_response
    global id_value
    json_response = context.postBoard.post_board(url_value, name_value, key_value, token_value)
    id_value = json_response.json()['id']


@then('Should return status code "{status_code}" OK')
def step_impl(context, status_code):
    assert json_response.status_code is int(status_code)
    print(json_response.json())
    expected = context.validate.validate_schema(json_response.text)
    assert True is expected


@step("Sends DELETE request")
def step_impl(context):
    context.postBoard.delete_board(url_value, id_value, key_value, token_value)


@step("Sends GET request")
def step_impl(context):
    context.postBoard.get_board(url_value, id_value, key_value, token_value)


@step('Should return "{message}"')
def step_impl(context, message):
    json_result = context.postBoard.return_message()
    assert json_result.text == message