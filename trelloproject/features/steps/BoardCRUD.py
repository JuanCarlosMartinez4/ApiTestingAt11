from behave import *

use_step_matcher("re")


@given("sets https://api.trello.com/1/boards")
def step_impl(context):
    """
    :type context: behave.runner.Context
    """
    print("post back")


@step("set authentication values")
def step_impl(context):
    """
    :type context: behave.runner.Context
    """
    print("post back")


@step("Sets POST request to /")
def step_impl(context):
    """
    :type context: behave.runner.Context
    """
    print("post back")


@step("Do Send")
def step_impl(context):
    """
    :type context: behave.runner.Context
    """
    print("post back")


@when("Sends POST request to /")
def step_impl(context):
    """
    :type context: behave.runner.Context
    """
    print("post back")


@then("Should return status code 200 OK")
def step_impl(context):
    """
    :type context: behave.runner.Context
    """
    print("post back")


@step('Saves return a body response as "boardObject"')
def step_impl(context):
    """
    :type context: behave.runner.Context
    """
    print("post back")


@then('Should return a body response as "addBoarObject"')
def step_impl(context):
    """
    :type context: behave.runner.Context
    """
    print("post back")


@step("Sends DELETE request to /:id")
def step_impl(context):
    """
    :type context: behave.runner.Context
    """
    print("post back")


@given("Sets GET request to /:id")
def step_impl(context):
    """
    :type context: behave.runner.Context
    """
    print("post back")


@when("Sends GET request to /:id")
def step_impl(context):
    """
    :type context: behave.runner.Context
    """
    print("post back")


@step("Should return a body response")
def step_impl(context):
    """
    :type context: behave.runner.Context
    """
    print("post back")


@given("Sets PUT request to /:id")
def step_impl(context):
    """
    :type context: behave.runner.Context
    """
    print("post back")


@when("Sends PUT request to /:id")
def step_impl(context):
    """
    :type context: behave.runner.Context
    """
    print("post back")


@step("Should return")
def step_impl(context):
    """
    :type context: behave.runner.Context
    """
    print("post back")