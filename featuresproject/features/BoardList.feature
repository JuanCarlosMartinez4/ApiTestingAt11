# Created by Juan at 22/01/2020
Feature: # Board's list
  # Manages lists of the board
  Background: Given sets https://api.trello.com/1/lists in postman
    And Choose OAuth 1.0 authorization type
    And Sets consumer Key value {costumerKey}
    And Sets consumer Key value {consumerKey}
    And Sets access token value {accessToken}
    And Sets token secret {tokenSecret}

  Scenario: # Create a new list on a board
    Given Sets POST request to /
      | name        | idBoard       |
      | newListName | {idListValue} |
    And Do Send
    When Sends POST request to /
      | name        | idBoard       |
      | newListName | {idListValue} |
    Then Should return status code 200 OK
    And Should return a body response
    """
    {
      "id": "{idValue}",
      "name": "newListName",
      "closed": false,
      "idBoard": "{idBoardValue}",
      "pos": 4096,
      "limits": {}
    }
    """

  Scenario: # Gets information about a list
    Given Sets GET request to /:id
      | id            |
      | {idListValue} |
    And Do Send
    When Sends GET request to /:id
      | id            |
      | {idListValue} |
    Then Should return status code 200 OK
    And Should return a body response
    """
    {
      "id": "{idListValue}",
      "name": "newListName",
      "closed": false,
      "idBoard": "{idBoardValue}",
      "pos": 4096
    }
    """

  Scenario: # Updates the properties of a list by id
    Given Sets PUT request to /:id
      | id            | name           |
      | {idListValue} | newListUpdated |
    And Do Send
    When Sends PUT request to /:id
      | id            | name           |
      | {idListValue} | newListUpdated |
    Then Should return status code 200 OK
    And Should return a body response
    """
    {
      "id": "{idListValue}",
      "name": "newListUpdated",
      "closed": false,
      "idBoard": "{idBoardValue}",
      "pos": 4096
    }
    """