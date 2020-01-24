from behave import given, step, then, when



@given("https://api.trello.com/1/boards")
def step_impl(context):
    print('board')
    """
    :type context: behave.runner.Context
    """


@step("Sets POST request to /")
def step_impl(context):
    """
    :type context: behave.runner.Context
    """
    print('post background')


@step("Do Send")
def step_impl(context):
    """
    :type context: behave.runner.Context
    """
    # raise NotImplementedError(u'STEP: And Do Send')
    print('do send')


@when("Sends POST request to /")
def step_impl(context):
    """
    :type context: behave.runner.Context
    """
    print('post')


@then("Should return status code 200 OK")
def step_impl(context):
    """
    :type context: behave.runner.Context
    """
    print('status')
    # raise NotImplementedError(u'STEP: Then Should return status code 200 OK')


@step('Saves return a body response as "boardObject"')
def step_impl(context):
    """
        :type context: behave.runner.Context
        """
    print('saves')


@step("Sends DELETE request to /:id")
def step_impl(context):
    """
        :type context: behave.runner.Context
        """
    print('delete')


@given("Sets GET request to /:id")
def step_impl(context):
    """
        :type context: behave.runner.Context
        """
    print('get')


@when("Sends GET request to /:id")
def step_impl(context):
    """
        :type context: behave.runner.Context
        """
    print('send get')


@step("Should return a body response")
def step_impl(context):
    """
        :type context: behave.runner.Context
        """
    print('return body')


@given("Sets PUT request to /:id")
def step_impl(context):
    """
        :type context: behave.runner.Context
        """
    print('put')


@when("Sends PUT request to /:id")
def step_impl(context):
    """
    :type context: behave.runner.Context
    """
    print('send put')


@step("Should return")
def step_impl(context):
    """
    :type context: behave.runner.Context
    """
    print('return')
