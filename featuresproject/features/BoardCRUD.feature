# Created by Juan at 22/01/2020
Feature: # CRUD of boards in Trello
  # Manages boards in Trello
  Background:
    Given sets https://api.trello.com/1/boards
    And set authentication values
    And Sets POST request to /
      | name        |
      | boardToTest |
    And Do Send
    When Sends POST request to /
      | name        |
      | boardToTest |
    Then Should return status code 200 OK
    And Saves return a body response as 'boardObject'
    """
    {
      "id": "{idBoardValue}", "name": "boardToTest", "desc": "",
      "descData": null, "closed": false, "idOrganization": null, "idEnterprise": null, "pinned": false,
      "url": "https://trello.com/b/{shortIdBoardValue}/newboardtest", "shortUrl": "https://trello.com/b/{shortIdBoardValue}",
      "prefs": { },
      "labelNames": { },
      "limits": {}
    }
    """

  Scenario: # Creates a new board in Trello
    Given Sets POST request to /
      | name         |
      | newBoardTest |
    And Do Send
    When Sends POST request to /
      | name         |
      | newBoardTest |
    Then Should return status code 200 OK
    And Should return a body response
    """
    {
      "id": "{idBoardValue}", "name": "newBoardTest", "desc": "",
      "descData": null, "closed": false, "idOrganization": null, "idEnterprise": null, "pinned": false,
      "url": "https://trello.com/b/{shortIdBoardValue}/newboardtest", "shortUrl": "https://trello.com/b/{shortIdBoardValue}",
      "prefs": { },
      "labelNames": { },
      "limits": {}
    }
    """
    And Sends DELETE request to /:id
      | id             |
      | {idBoardValue} |
    Then Should return status code 200 OK
      """
      {
        "_value": null
      }
      """

  Scenario: # Requests a single board
    Given Sets GET request to /:id
      | id               |
      | {boardObject.id} |
    And Do Send
    When Sends GET request to /:id
      | id               |
      | {boardObject.id} |
    Then Should return status code 200 OK
    And Should return a body response
    """
    {
      "id": "{idBoardValue}", "name": "boardToTest", "desc": "",
      "descData": null, "closed": false, "idOrganization": null, "idEnterprise": null, "pinned": false,
      "url": "https://trello.com/b/{shortIdBoardValue}/boardtotest", "shortUrl": "https://trello.com/b/{shortIdBoardValue}",
      "prefs": {  },
      "labelNames": { }
    }
    """

  Scenario: # Updates an existing board by id
    Given Sets PUT request to /:id
      | id               | name         | desc                  |
      | {boardObject.id} | updatedBoard | this is a description |
    And Do Send
    When Sends PUT request to /:id
      | id               | name         | desc                  |
      | {boardObject.id} | updatedBoard | this is a description |
    Then Should return status code 200 OK
    And Should return a body response
    """
    {
      "id": "{idBoardValue}", "name": "updatedBoard",
      "desc": "this is a description", "descData": null, "closed": false, "idOrganization": null,
      "idEnterprise": null, "pinned": false, "url": "https://trello.com/b/{shortIdBoardValue}/updatedBoard",
      "shortUrl": "https://trello.com/b/{shortIdBoardValue}",
      "prefs": {  },
      "labelNames": { }
    }
    """

  Scenario: # Deletes a board
    When Sends DELETE request to /:id
      | id               |
      | {boardObject.id} |
    Then Should return status code 200 OK
      """
      {
        "_value": null
      }
      """
    And Sends GET request to /:id
      | id               |
      | {boardObject.id} |
    And Do Send
    And Should return
      | The requested resource was not found. |