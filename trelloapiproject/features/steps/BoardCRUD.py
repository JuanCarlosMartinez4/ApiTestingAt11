from behave import given, when, then, step

from codelogic.SchemaValidator import SchemaValidator
from codelogic.CRUDBoardRequest import CRUDBoardRequest

id_value = ""
url_value = ""
name_value = ""
json_response = ""
key_value = ""
token_value = ""
desc_value = ""


@given('Sets board URL "{url}"')
def step_impl(context, url):
    context.CrudBoard = CRUDBoardRequest()
    context.validate = SchemaValidator()
    global url_value
    url_value = url


@step('Sets board KEY "{key}"')
def step_impl(context, key):
    global key_value
    key_value = key


@step('Sets board TOKEN "{token}"')
def step_impl(context, token):
    global token_value
    token_value = token


# @step('Sets to POST "{name}"')  #ff
# def step_impl(context, name):
#     global name_value
#     name_value = name


@when("Sends board POST request")
def step_impl(context):
    global json_response
    global id_value
    json_response = context.CrudBoard.post_board(url_value, name_value, key_value, token_value)
    id_value = json_response.json()['id']


@then('Should return board status code "{status_code}" OK')
def step_impl(context, status_code):
    assert json_response.status_code is int(status_code)
    print(json_response.json())
    expected = context.validate.validate_schema(json_response.text)
    assert True is expected


@step('Should return board status code "{status_code}" OK')
def step_impl(context, status_code):
    assert json_response.status_code is int(status_code)
    print(json_response.json())
    expected = context.validate.validate_schema(json_response.text)
    assert True is expected


@given('Sets to POST the "{name}"')
def step_impl(context, name):
    global name_value
    name_value = name


@when("Sends board DELETE request")
def step_impl(context):
    context.CrudBoard.delete_board(url_value, id_value, key_value, token_value)


@step("Sends board DELETE request")
def step_impl(context):
    context.CrudBoard.delete_board(url_value, id_value, key_value, token_value)


@when("Sends board GET request")
def step_impl(context):
    context.CrudBoard.get_board(url_value, id_value, key_value, token_value)


@step("Sends board GET request")
def step_impl(context):
    context.CrudBoard.get_board(url_value, id_value, key_value, token_value)


@step('Should return board "{message}"')
def step_impl(context, message):
    json_result = context.CrudBoard.return_message()
    assert json_result.text == message


@when("Sends GET request")
def step_impl(context):
    context.CrudBoard.get_board(url_value, id_value, key_value, token_value)


@step('Sets to PUT the "{name_a}" and "{desc}"')
def step_impl(context, name_a, desc):
    global name_value
    global desc_value
    name_value = name_a
    desc_value = desc


@step("Sends PUT request")
def step_impl(context):
    global id_value
    global json_response
    json_response = context.CrudBoard.put_board(url_value, name_value, desc_value, key_value, token_value)
    id_value = json_response.json()['id']
