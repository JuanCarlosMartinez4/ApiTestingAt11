from behave import given, when, then, step

from codelogic.SchemaValidator import SchemaValidator
from coderequests.PostBoardRequest import PostBoardRequest

id_value = ""
url_value = ""
name_value = ""
json_response = ""


@given('Sets POST request to "{url}"')
def step_impl(context, url):
    context.postBoard = PostBoardRequest()
    global url_value
    url_value = url


@step('sets name "{board_name}"')
def step_impl(context, board_name):
    global name_value
    name_value = board_name


@when("Sends POST request")
def step_impl(context):
    context.postBoard.post_board_request(url_value, name_value)
    global json_response
    json_response = context.postBoard.get_response()
    global id_value
    id_value = json_response.json()['id']


@then('Should return status code "{status_code}" OK')
def step_impl(context, status_code):
    assert json_response.status_code is int(status_code)
    print(json_response.json())
    context.validate = SchemaValidator()
    expected = context.validate.validate_schema(json_response.text)
    assert True is expected


@step('Sets DELETE request to "{delete_url}"')
def step_impl(context, delete_url):
    global url_value
    url_value = delete_url


@step("Sends DELETE request")
def step_impl(context):
    context.postBoard.delete_board_request(url_value, id_value)


@step('Sets GET request to "{get_url}"')
def step_impl(context, get_url):
    global url_value
    url_value = get_url


@step("Sends GET request")
def step_impl(context):
    context.postBoard.get_board_request(url_value, id_value)


@step('Should return "{message}"')
def step_impl(context, message):
    json_result = context.postBoard.return_message()
    assert json_result.text == message
