from behave import given, when, then, step, use_step_matcher

use_step_matcher("re")

@given("sets https://api/trello/com/1/boards")
def step_impl(context):
    """
    :type context: behave.runner.Context
    """
    # raise NotImplementedError(u'STEP: Given sets https://api.trello.com/1/boards in postman')


@step("Choose OAuth 1.0 authorization type")
def step_impl(context):
    """
    :type context: behave.runner.Context
    """
    # raise NotImplementedError(u'STEP: And Choose OAuth 1.0 authorization type')

@step("Sets POST request to /")
def step_impl(context):
    """
    :type context: behave.runner.Context
    """
    #raise NotImplementedError(u'STEP: And Sets POST request to /
     #                         | name |
      #                        | boardToTest | ')


@step("Do Send")
def step_impl(context):
    """
    :type context: behave.runner.Context
    """
    # raise NotImplementedError(u'STEP: And Do Send')


@when("Sends POST request to /")
def step_impl(context):
    """
    :type context: behave.runner.Context
    """
    #raise NotImplementedError(u'STEP: When Sends POST request to /
     #                         | name |
      #                        | boardToTest | ')


@then("Should return status code 200 OK")
def step_impl(context):
    """
    :type context: behave.runner.Context
    """
    # raise NotImplementedError(u'STEP: Then Should return status code 200 OK')


@step("Saves return a body response as 'boardObject'")
def step_impl(context):
    """
    :type context: behave.runner.Context
    """
    # raise NotImplementedError(u'STEP: And Saves return a body response as \'boardObject\'
    #                           """
    #                           {
    #                             "id": "{idBoardValue}", "name": "boardToTest", "desc": "",
    #                             "descData": null, "closed": false, "idOrganization": null, "idEnterprise": null, "pinned": false,
    #                             "url": "https://trello.com/b/{shortIdBoardValue}/newboardtest", "shortUrl": "https://trello.com/b/{shortIdBoardValue}",
    #                             "prefs": { },
    #                             "labelNames": { },
    #                             "limits": {}
    #                           }
    #                           """')


@step("Should return a body response")
def step_impl(context):
    """
    :type context: behave.runner.Context
    """
    # raise NotImplementedError(u'STEP: And Should return a body response
    #                           """
    #                           {
    #                             "id": "{idBoardValue}", "name": "newBoardTest", "desc": "",
    #                             "descData": null, "closed": false, "idOrganization": null, "idEnterprise": null, "pinned": false,
    #                             "url": "https://trello.com/b/{shortIdBoardValue}/newboardtest", "shortUrl": "https://trello.com/b/{shortIdBoardValue}",
    #                             "prefs": { },
    #                             "labelNames": { },
    #                             "limits": {}
    #                           }
    #                           """')


@step("Sends DELETE request to /:id")
def step_impl(context):
    """
    :type context: behave.runner.Context
    """
    # raise NotImplementedError(u'STEP: And Sends DELETE request to /:id
    #                           | id |
    #                           | {idBoardValue} | ')


@given("Sets GET request to /:id")
def step_impl(context):
    """
    :type context: behave.runner.Context
    """
    # raise NotImplementedError(u'STEP: Given Sets GET request to /:id
    #                           | id |
    #                           | {boardObject.id} | ')


@when("Sends GET request to /:id")
def step_impl(context):
    """
    :type context: behave.runner.Context
    """
    # raise NotImplementedError(u'STEP: When Sends GET request to /:id
    #                           | id |
    #                           | {boardObject.id} | ')


@given("Sets PUT request to /:id")
def step_impl(context):
    """
    :type context: behave.runner.Context
    """
    # raise NotImplementedError(u'STEP: Given Sets PUT request to /:id
    #                           | id | name | desc |
    #                           | {boardObject.id} | updatedBoard | this is a
    # description | ')


@when("Sends PUT request to /:id")
def step_impl(context):
    """
    :type context: behave.runner.Context
    """
    # raise NotImplementedError(u'STEP: When Sends PUT request to /:id
    #                           | id | name | desc |
    #                           | {boardObject.id} | updatedBoard | this is a
    # description | ')


@step("Should return")
def step_impl(context):
    """
    :type context: behave.runner.Context
    """
    # raise NotImplementedError(u'STEP: And Should return
    #                           | The
    # requested
    # resource
    # was
    # not found. | ')