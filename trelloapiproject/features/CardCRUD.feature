# Created by Juan at 22/01/2020
Feature: # CRUD of cards in an existent list
  # Manages cards in an existent list
  Background: Given sets https://api.trello.com/1/cards in postman
    And Choose OAuth 1.0 authorization type
    And Sets Consumer Key value {costumerKey}
    And Sets Consumer Secret value {consumerSecret}
    And Sets Access Token value {accessToken}
    And Sets Token Secret {tokenSecret}
    And Sets POST request to https://api.trello.com/1/boards/
      | name        |
      | boardToTest |
    And Do Send
    When Sends POST request to https://api.trello.com/1/boards/
      | name        |
      | boardToTest |
    Then Should return status code 200 OK
    And Saves return a body response as 'boardObject'
    And Sets POST request to https://api.trello.com/1/lists/
      | name            | idBoard          |
      | newListNameTest | {boardObject.id} |
    And Do Send
    And Sends POST request to https://api.trello.com/1/lists/
      | name            | idBoard          |
      | newListNameTest | {boardObject.id} |
    And Should return status code 200 OK
    And Saves return a body response as 'listObject'
    And Sets POST request to /
      | name            | desc        | idList        |
      | newNameCardTest | description | {idListValue} |
    And Do Send
    And Sends POST request to /
      | name            | desc        | idList        |
      | newNameCardTest | description | {idListValue} |
    Then Should return status code 200 OK
    And Saves return a body response as 'cardObject'

  Scenario: # Creates a new card
    Given Sets POST request to /
      | name        | desc        | idList          |
      | newCardTest | description | {listObject.id} |
    And Do Send
    When Sends POST request to /
      | name        | desc        | idList          |
      | newCardTest | description | {listObject.id} |
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
    And Sends DELETE request to /:id
      | id            |
      | {idCardValue} |
    And Should return status code 200 OK
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

  Scenario: # Gets a card by its ID
    Given Sets GET request to /:id
      | id              |
      | {cardObject.id} |
    And Do Send
    When Sends GET request to /:id
      | id              |
      | {cardObject.id} |
    Then Should return status code 200 OK
    And Should return a body response
    """
    {
      "id": "{cardObject.id}",
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
      | id              | name           | desc                  |
      | {cardObject.id} | newCardUpdated | this is a description |
    And Do Send
    When Sends PUT request to /:id
      | id              | name           | desc                  |
      | {cardObject.id} | newCardUpdated | this is a description |
    Then Should return status code 200 OK
    And Should return a body response
    """
    {
      "id": "{cardObject.id}",
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
    When Sends DELETE request to /:id
      | id              |
      | {cardObject.id} |
    Then Should return status code 200 OK
    """
    {
      "limits": {}
    }
    """
    And Sets GET request to /:id
      | id              |
      | {cardObject.id} |
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