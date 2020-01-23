# Created by Juan at 22/01/2020
Feature: # CRUD of cards in an existent list
  # Manages cards in an existent list
  Background: Given sets https://api.trello.com/1/cards in postman
    And Choose OAuth 1.0 authorization type
    And Sets consumer Key value {costumerKey}
    And Sets consumer Key value {consumerKey}
    And Sets access token value {accessToken}
    And Sets token secret {tokenSecret}

  Scenario: # Creates a new card
    Given Sets POST request to /
      | name        | desc        | idList        |
      | newCardTest | description | {idListValue} |
    And Do Send
    When Sends POST request to /
      | name        | desc        | idList        |
      | newCardTest | description | {idListValue} |
    Then Should return status code 200 OK
    And Should return a body response
    """
    {
      "id": "{idCardValue}",
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
      | id            |
      | {idCardValue} |

  Scenario: # Gets a card by its ID
    Given Sets GET request to /:id
      | id            |
      | {idCardValue} |
    And Do Send
    When Sends GET request to /:id
      | id            |
      | {idCardValue} |
    Then Should return status code 200 OK
    And Should return a body response
    """
    {
      "id": "{idCardValue}",
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
    Given Sets PUT request to /:id
      | id            | name           | desc                  |
      | {idCardValue} | newCardUpdated | this is a description |
    And Do Send
    When Sends PUT request to /:id
      | id            | name           | desc                  |
      | {idCardValue} | newCardUpdated | this is a description |
    Then Should return status code 200 OK
    And Should return a body response
    """
    {
      "id": "{idCardValue}",
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
    Given Sets POST request to /
      | name            | desc        | idList        |
      | newCardToDelete | description | {idListValue} |
    And Do Send
    And Saves the response status code 200 OK
    """
    {
      "id": "{idCardValue}",
      "name": "newCardToDelete",
      "desc": "description"
    }
    """
    When Sends DELETE request to /:id
      | id                       |
      | {idCardValue} |
    Then Should return status code 200 OK
    """
    {
      "limits": {}
    }
    """
    And Sets GET request to /:id
      | id                       |
      | {idCardValue} |
    And Do Send
    And Should return
      | The requested resource was not found. |