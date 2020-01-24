# Created by Admin at 1/24/2020
Feature: # Post board in trello
  # Posts board in trello api
#  Background:
#    Given sets https://api.trello.com/1/boards/
#    And set authentication values

  Scenario: # Creates a new board in Trello
    Given Sets POST request to "https://api.trello.com/1/boards/"
    And sets name "boardTest"
    And Do Send
    When Sends POST request
    Then Should return status code "200" OK
    And Sets DELETE request to "https://api.trello.com/1/boards/"
    And Sends DELETE request
    And Should return status code "200" OK
    And Sets GET request to "https://api.trello.com/1/boards/"
    And Sends GET request
    And Should return "The requested resource was not found."