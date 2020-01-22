# Created by Juan at 22/01/2020
Feature: # CRUD of boards in Trello
  # Manages boards in Trello
  Background: Given Open https://api.trello.com/1/boards
    And Choose OAuth 1.0 authorization type
    And Sets consumer Key value 4178a940f6bdaed61804b6ff90d6d20e
    And Sets consumer Key value 8387f39df2be974b25eaff1c463c651f5107242a596a912e5a79d90ba0fdc619
    And Sets access token value e90ca503e4f0357e22543ff44250c74a98640c14d9e62e509b9171b5a4e8ecc6
    And Sets token secret e90ca503e4f0357e22543ff44250c74a98640c14d9e62e509b9171b5a4e8ecc6

  Scenario: # Creates a new board in Trello
    Given Sends POST request to /
      | name     |
      | newBoard |
    And Adds the new board's name as a Query Parameter
    And Do Send
    When Sends POST request to /
      | name     |
      | newBoard |
    Then Should return status code 200 OK
    And Should return a body response
    """
    {
      "id": "5e273880f83a444e7d136401", "name": "newBoard", "desc": "",
      "descData": null, "closed": false, "idOrganization": null, "idEnterprise": null, "pinned": false,
      "url": "https://trello.com/b/C4qfvJlR/newboard", "shortUrl": "https://trello.com/b/C4qfvJlR",
      "prefs": { },
      "labelNames": { },
      "limits": {}
    }
    """
    And Sends GET request to /:id
      | id                       |
      | 5e273880f83a444e7d136401 |

  Scenario: # Requests a single board
    Given Sends GET request to /:id
      | id                       |
      | 5e273880f83a444e7d136401 |
    And Do Send
    When Sends GET request to /:id
      | id                       |
      | 5e273880f83a444e7d136401 |
    Then Should return status code 200 OK
    And Should return a body response
    """
    {
      "id": "5e273880f83a444e7d136401", "name": "newBoard", "desc": "",
      "descData": null, "closed": false, "idOrganization": null, "idEnterprise": null, "pinned": false,
      "url": "https://trello.com/b/C4qfvJlR/newboard", "shortUrl": "https://trello.com/b/C4qfvJlR",
      "prefs": {  },
      "labelNames": { }
    }
    """

  Scenario: # Updates an existing board by id
    Given Sends PUT request to /:id
      | id                       | name         | desc                  |
      | 5e273880f83a444e7d136401 | updatedBoard | this is a description |
    And Do Send
    When Sends PUT request to /:id
      | id                       | name         | desc                  |
      | 5e273880f83a444e7d136401 | updatedBoard | this is a description |
    Then Should return status code 200 OK
    And Should return a body response
    """
    {
      "id": "5e273880f83a444e7d136401", "name": "updatedBoard",
      "desc": "this is a description", "descData": null, "closed": false, "idOrganization": null,
      "idEnterprise": null, "pinned": false, "url": "https://trello.com/b/C4qfvJlR/newboard",
      "shortUrl": "https://trello.com/b/C4qfvJlR",
      "prefs": {  },
      "labelNames": { }
    }
    """

  Scenario: # Deletes a board
    Given Sends POST request to /
      | name             |
      | newBoardToDelete |
    And Do Send
    And Saves the response status code 200 OK
    """
    {
      "id": "5e284293315ab813e2b5e4dc",
      "name": "newBoardToDelete",
      "desc": ""
    }
    """
    When Sends DELETE request to /:id
      | id                       |
      | 5e284293315ab813e2b5e4dc |
    Then Should return status code 200 OK
      """
      {
        "_value": null
      }
      """
    And Sends GET request to /:id
      | id                       |
      | 5e284293315ab813e2b5e4dc |
    And Do Send
    And Should return
      | The requested resource was not found. |