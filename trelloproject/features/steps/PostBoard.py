from behave import given, when, then, step

from requeststrello.PostBoardRequest import PostBoardRequest

id_value = ""


@given('Sets POST request to "{url}"')
def step_impl(context, url):
    context.postBoard = PostBoardRequest()
    context.postBoard.add_url(url)


@step('sets name "{board_name}"')
def step_impl(context, board_name):
    context.postBoard.add_name(board_name)


@when("Sends POST request")
def step_impl(context):
    context.postBoard.post_board_request()
    json_response = context.postBoard.get_response()
    global id_value
    id_value = json_response.json()['id']


@then('Should return status code "{status_code}" OK')
def step_impl(context, status_code):
    json_response = context.postBoard.get_response()
    assert json_response.status_code is int(status_code)


@step('Sets DELETE request to "{delete_url}"')
def step_impl(context, delete_url):
    context.postBoard.add_url(delete_url)
    context.postBoard.set_board_id(id_value)


@step("Sends DELETE request")
def step_impl(context):
    context.postBoard.delete_board_request()


@step('Sets GET request to "{get_url}"')
def step_impl(context, get_url):
    context.postBoard.add_url(get_url)
    context.postBoard.set_board_id(id_value)


@step("Sends GET request")
def step_impl(context):
    context.postBoard.get_board_request()


@step('Should return "{message}"')
def step_impl(context, message):
    json_result = context.postBoard.return_message()
    assert json_result.text == message
