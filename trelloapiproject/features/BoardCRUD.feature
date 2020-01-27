# Created by Juan at 22/01/2020
Feature: # CRUD of boards in Trello
  # Manages boards in Trello
  Background:
    Given Sets board URL "https://api.trello.com/1/boards/"
    And Sets board KEY "keyvalue"
    And Sets board TOKEN "tokenvalue"

  Scenario Outline: # Creates a new board in Trello
    Given Sets to POST the "<name>"
    Examples:
      | name         |
      | newBoardPOST |
    When Sends board POST request
    Then Should return board status code "200" OK
    And Sends board DELETE request
    And Should return board status code "200" OK
    And Sends board GET request
    And Should return board "The requested resource was not found."

  Scenario Outline: # Requests a single board
    Given Sets to POST the "<name>"
    Examples:
      | name         |
      | newBoardGET |
    When Sends board POST request
    And Sends board GET request
    Then Should return board status code "200" OK
    And Sends board DELETE request
    And Should return board status code "200" OK
    And Sends board GET request
    And Should return board "The requested resource was not found."

  Scenario Outline: # Updates an existing board by id
    Given Sets to POST the "<name>"
    Examples:
      | name        |
      | newBoardPUT |
    When Sends board POST request
    And Sets to PUT the "<name_a>" and "<desc>"
    Examples:
      | name_a          | desc                  |
      | updatedBoardPUT | this is a description |
    And Sends PUT request
    Then Should return board status code "200" OK
    And Sends board DELETE request
    And Should return board status code "200" OK
    And Sends board GET request
    And Should return board "The requested resource was not found."

  Scenario Outline: # Deletes a board
    Given Sets to POST the "<name>"
    Examples:
      | name           |
      | newBoardDELETE |
    When Sends board POST request
    And Sends board DELETE request
    Then Should return board status code "200" OK
    And Sends board GET request
    And Should return board "The requested resource was not found."