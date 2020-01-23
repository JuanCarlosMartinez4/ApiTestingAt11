# Created by Juan at 22/01/2020
Feature: # Board's list
  # Manages lists of the board
  Background:
    Given sets https://api.trello.com/1/lists in postman
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
      | newListNameTest | {boardObject.id} |
    And Should return status code 200 OK
    And Should return a body response as 'listObject'

  Scenario: # Create a new list on a board
    Given Sets POST request to /
      | name        | idBoard          |
      | newListName | {boardObject.id} |
    And Do Send
    When Sends POST request to /
      | name        | idBoard          |
      | newListName | {boardObject.id} |
    Then Should return status code 200 OK
    And Should return a body response
    """
    {
      "id": "{idListValue}",
      "name": "newListName",
      "closed": false,
      "idBoard": "{boardObject.id}",
      "pos": 4096,
      "limits": {}
    }
    """

  Scenario: # Gets information about a list
    Given Sets GET request to /:id
      | id              |
      | {listObject.id} |
    And Do Send
    When Sends GET request to /:id
      | id              |
      | {listObject.id} |
    Then Should return status code 200 OK
    And Should return a body response
    """
    {
      "id": "{listObject.id}",
      "name": "newListNameTest",
      "closed": false,
      "idBoard": "{objectBoard.id}",
      "pos": 4096
    }
    """

  Scenario: # Updates the properties of a list by id
    Given Sets PUT request to /:id
      | id              | name               |
      | {listObject.id} | newListTestUpdated |
    And Do Send
    When Sends PUT request to /:id
      | id              | name               |
      | {listObject.id} | newListTestUpdated |
    Then Should return status code 200 OK
    And Should return a body response
    """
    {
      "id": "{listObject.id}",
      "name": "newListUpdated",
      "closed": false,
      "idBoard": "{boardObject.id}",
      "pos": 4096
    }
    """
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