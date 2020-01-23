# Created by Juan at 22/01/2020
Feature: # CRUD of boards in Trello
  # Manages boards in Trello
  Background: Given sets https://api.trello.com/1/boards in postman
    And Choose OAuth 1.0 authorization type
    And Sets consumer Key value {costumerKey}
    And Sets consumer Key value {consumerKey}
    And Sets access token value {accessToken}
    And Sets token secret {tokenSecret}

  Scenario: # Creates a new board in Trello
    Given Sets POST request to /
      | name     |
      | newBoard |
    And Do Send
    When Sends POST request to /
      | name     |
      | newBoard |
    Then Should return status code 200 OK
    And Should return a body response
    """
    {
      "id": "{idBoardValue}", "name": "newBoard", "desc": "",
      "descData": null, "closed": false, "idOrganization": null, "idEnterprise": null, "pinned": false,
      "url": "https://trello.com/b/{shortIdBoardValue}/newboard", "shortUrl": "https://trello.com/b/{shortIdBoardValue}",
      "prefs": { },
      "labelNames": { },
      "limits": {}
    }
    """
    And Sends GET request to /:id
      | id             |
      | {idBoardValue} |

  Scenario: # Requests a single board
    Given Sets GET request to /:id
      | id             |
      | {idBoardValue} |
    And Do Send
    When Sends GET request to /:id
      | id             |
      | {idBoardValue} |
    Then Should return status code 200 OK
    And Should return a body response
    """
    {
      "id": "{idBoardValue}", "name": "newBoard", "desc": "",
      "descData": null, "closed": false, "idOrganization": null, "idEnterprise": null, "pinned": false,
      "url": "https://trello.com/b/{shortIdBoardValue}/newboard", "shortUrl": "https://trello.com/b/{shortIdBoardValue}",
      "prefs": {  },
      "labelNames": { }
    }
    """

  Scenario: # Updates an existing board by id
    Given Sets PUT request to /:id
      | id             | name         | desc                  |
      | {idBoardValue} | updatedBoard | this is a description |
    And Do Send
    When Sends PUT request to /:id
      | id             | name         | desc                  |
      | {idBoardValue} | updatedBoard | this is a description |
    Then Should return status code 200 OK
    And Should return a body response
    """
    {
      "id": "{idBoardValue}", "name": "updatedBoard",
      "desc": "this is a description", "descData": null, "closed": false, "idOrganization": null,
      "idEnterprise": null, "pinned": false, "url": "https://trello.com/b/{shortIdBoardValue}/newboard",
      "shortUrl": "https://trello.com/b/{shortIdBoardValue}",
      "prefs": {  },
      "labelNames": { }
    }
    """

  Scenario: # Deletes a board
    Given Sets POST request to /
      | name             |
      | newBoardToDelete |
    And Do Send
    And Saves the response status code 200 OK
    """
    {
      "id": "{idBoardValue}",
      "name": "newBoardToDelete",
      "desc": ""
    }
    """
    When Sends DELETE request to /:id
      | id             |
      | {idBoardValue} |
    Then Should return status code 200 OK
      """
      {
        "_value": null
      }
      """
    And Sends GET request to /:id
      | id             |
      | {idBoardValue} |
    And Do Send
    And Should return
      | The requested resource was not found. |