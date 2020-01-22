# Created by Juan at 22/01/2020
Feature: # Board's list
  # Manages lists of the board
  Background: Given Open https://api.trello.com/1/lists
    And Choose OAuth 1.0 authorization type
    And Sets consumer Key value 4178a940f6bdaed61804b6ff90d6d20e
    And Sets consumer Key value 8387f39df2be974b25eaff1c463c651f5107242a596a912e5a79d90ba0fdc619
    And Sets access token value e90ca503e4f0357e22543ff44250c74a98640c14d9e62e509b9171b5a4e8ecc6
    And Sets token secret e90ca503e4f0357e22543ff44250c74a98640c14d9e62e509b9171b5a4e8ecc6

  Scenario: # Create a new list on a board
    Given Sends POST request to /
      | name        | idBoard                  |
      | newListName | 5e273880f83a444e7d136401 |
    And Do Send
    When Sends POST request to /
      | name        | idBoard                  |
      | newListName | 5e273880f83a444e7d136401 |
    Then Should return status code 200 OK
    And Should return a body response
    """
    {
      "id": "5e2854545aecd28ee10996bc",
      "name": "newListName",
      "closed": false,
      "idBoard": "5e273880f83a444e7d136401",
      "pos": 4096,
      "limits": {}
    }
    """

  Scenario: # Gets information about a list
    Given Sends GET request to /:id
      | id                       |
      | 5e2854545aecd28ee10996bc |
    And Do Send
    When Sends GET request to /:id
      | id                       |
      | 5e2854545aecd28ee10996bc |
    Then Should return status code 200 OK
    And Should return a body response
    """
    {
      "id": "5e2854545aecd28ee10996bc",
      "name": "newListName",
      "closed": false,
      "idBoard": "5e273880f83a444e7d136401",
      "pos": 4096
    }
    """

  Scenario: # Updates the properties of a list by id
    Given Sends PUT request to /:id
      | id                       | name           |
      | 5e2854545aecd28ee10996bc | newListUpdated |
    And Do Send
    When Sends PUT request to /:id
      | id                       | name           |
      | 5e2854545aecd28ee10996bc | newListUpdated |
    Then Should return status code 200 OK
    And Should return a body response
    """
    {
      "id": "5e2854545aecd28ee10996bc",
      "name": "newListUpdated",
      "closed": false,
      "idBoard": "5e273880f83a444e7d136401",
      "pos": 4096
    }
    """