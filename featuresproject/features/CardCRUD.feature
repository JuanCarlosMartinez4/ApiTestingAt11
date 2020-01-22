# Created by Juan at 22/01/2020
Feature: # CRUD of cards in an existent list
  # Manages cards in an existent list
  Background: Given Open https://api.trello.com/1/boards
    And Choose OAuth 1.0 authorization type
    And Sets consumer Key value 4178a940f6bdaed61804b6ff90d6d20e
    And Sets consumer Key value 8387f39df2be974b25eaff1c463c651f5107242a596a912e5a79d90ba0fdc619
    And Sets access token value e90ca503e4f0357e22543ff44250c74a98640c14d9e62e509b9171b5a4e8ecc6
    And Sets token secret e90ca503e4f0357e22543ff44250c74a98640c14d9e62e509b9171b5a4e8ecc6

  Scenario: # Creates a new card
    Given Sends POST request to /
      | name        | desc        | idList                   |
      | newCardTest | description | 5e2854545aecd28ee10996bc |
    And Do Send
    When Sends POST request to /
      | name        | desc        | idList                   |
      | newCardTest | description | 5e2854545aecd28ee10996bc |
    Then Should return status code 200 OK
    And Should return a body response
    """
    {
      "id": "5e285b55a97a1d6cab6abfd7",
      "badges": {
          "attachmentsByType": {
              "trello": {
                  "board": 0,
                  "card": 0
              }
          },
      },
      "isTemplate": false,
      "limits": {}
    }
    """
    And Sends GET request to /:id
      | id                       |
      | 5e285b55a97a1d6cab6abfd7 |

  Scenario: # Gets a card by its ID
    Given Sends GET request to /:id
      | id                       |
      | 5e285b55a97a1d6cab6abfd7 |
    And Do Send
    When Sends GET request to /:id
      | id                       |
      | 5e285b55a97a1d6cab6abfd7 |
    Then Should return status code 200 OK
    And Should return a body response
    """
    {
      "id": "5e285b55a97a1d6cab6abfd7",
      "badges": {
          "attachmentsByType": {
              "trello": {
                  "board": 0,
                  "card": 0
              }
          }
      }
      "isTemplate": false
    }
    """

  Scenario: # Updates a card
    Given Sends PUT request to /:id
      | id                       | name           | desc                  |
      | 5e285b55a97a1d6cab6abfd7 | newCardUpdated | this is a description |
    And Do Send
    When Sends PUT request to /:id
      | id                       | name           | desc                  |
      | 5e285b55a97a1d6cab6abfd7 | newCardUpdated | this is a description |
    Then Should return status code 200 OK
    And Should return a body response
    """
    {
      "id": "5e285b55a97a1d6cab6abfd7",
      "badges": {
          "attachmentsByType": {
              "trello": {
                  "board": 0,
                  "card": 0
              }
          },
      "isTemplate": false
    }
    """

  Scenario: # Deletes a card
    Given Sends POST request to /
      | name            | desc        | idList                   |
      | newCardToDelete | description | 5e2854545aecd28ee10996bc |
    And Do Send
    And Saves the response status code 200 OK
    """
    {
      "id": "5e285f7fde02ae7ea891993a",
      "name": "newCardToDelete",
      "desc": "description"
    }
    """
    When Sends DELETE request to /:id
      | id                       |
      | 5e285f7fde02ae7ea891993a |
    Then Should return status code 200 OK
    """
    {
      "limits": {}
    }
    """
    And Sends GET request to /:id
      | id                       |
      | 5e285f7fde02ae7ea891993a |
    And Do Send
    And Should return
      | The requested resource was not found. |