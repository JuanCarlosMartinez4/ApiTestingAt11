# Created by Juan at 1/23/2020
Feature: # CRUD label
  # Manages labelss of board
    Background:
    Given sets https://api.trello.com/1/labels in postman
    And Choose OAuth 1.0 authorization type
    And Sets Consumer Key value {costumerKey}
    And Sets Consumer Secret value {consumerSecret}
    And Sets Access Token value {accessToken}
    And Sets Token Secret {tokenSecret}
    And Sets POST request to https://api.trello.com/1/boards
      | name        |
      | boardToTest |
    And Do Send
    When Sends POST request to /
      | name        |
      | boardToTest |
    Then Should return status code 200 OK
    And Saves return a body response as 'boardObject'
    And Sets POST request to /
      | name            | idBoard          |
      | newListNameTest | {boardObject.id} |
    And Do Send
    And Sends POST request to /
      | name            | idBoard          |
      | newLabelNameTest | {boardObject.id} |
    And Should return status code 200 OK
    And Should return a body response as 'labelObject'

  Scenario: # Create a new label on a board
    Given Sets POST request to /
      | name         | color  | idBoard          |
      | newLabelName | yellow | {boardObject.id} |
    And Do Send
    When Sends POST request to /
      | name         | color  | idBoard          |
      | newLabelName | yellow | {boardObject.id} |
    Then Should return status code 200 OK
    And Should return a body response
    """
    {
      "id": "{idLabelValue}",
      "name": "newLabelName",
      "closed": false,
      "idBoard": "{boardObject.id}",
      "pos": 4096,
      "limits": {}
    }
    """
    And Sends DELETE request to /:id
      | id            |
      | {idLabelValue} |
    And Should return status code 200 OK
    """
    {
      "limits": {}
    }
    """
    And Sets GET request to /:id
      | id                       |
      | {idLabelValue} |
    And Do Send
    And Should return
      | The requested resource was not found. |

  Scenario: # Gets information about a label by ID
    Given Sets GET request to /:id
      | id               |
      | {labelObject.id} |
    And Do Send
    When Sends GET request to /:id
      | id               |
      | {labelObject.id} |
    Then Should return status code 200 OK
    And Should return a body response
    """
    {
      "id": "{labelObject.id}",
      "name": "newLabelNameTest",
      "closed": false,
      "idBoard": "{objectBoard.id}",
      "pos": 4096
    }
    """

  Scenario: # Updates a label by ID
    Given Sets PUT request to /:id
      | id               | name                | color |
      | {labelObject.id} | newLabelTestUpdated | green |
    And Do Send
    When Sends PUT request to /:id
      | id               | name                | color |
      | {labelObject.id} | newLabelTestUpdated | green |
    Then Should return status code 200 OK
    And Should return a body response
    """
    {
      "id": "{labelObject.id}",
      "name": "newLabelTestUpdated",
      "closed": false,
      "idBoard": "{boardObject.id}",
      "pos": {}
    }
    """

  Scenario: # Deletes a label by ID
    When Sends DELETE request to /:id
      | id              |
      | {labelObject.id} |
    Then Should return status code 200 OK
    """
    {
      "limits": {}
    }
    """
    And Sets GET request to /:id
      | id              |
      | {labelObject.id} |
    And Do Send
    And Should return
      | The requested resource was not found. |
    And Sends DELETE request to https://api.trello.com/1/boards/:id
      | id               |
      | {boardObject.id} |
    And Should return status code 200 OK
      """
      {
        "_value": null
      }
      """
    And Sends GET request to https://api.trello.com/1/boards/:id
      | id               |
      | {boardObject.id} |
    And Do Send
    And Should return
      | The requested resource was not found. |
