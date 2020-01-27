# Created by Admin at 1/24/2020
Feature: # Post board in trello
  # Posts board in trello api
  Background:
    Given Sets URL "https://api.trello.com/1/boards/"
    And Sets KEY "4178a940f6bdaed61804b6ff90d6d20e"
    And Sets TOKEN "e90ca503e4f0357e22543ff44250c74a98640c14d9e62e509b9171b5a4e8ecc6"

  Scenario: # Creates a new board in Trello
    Given Sets name "boardTest"
    When Sends POST request
    Then Should return status code "200" OK
    And Sends DELETE request
    And Should return status code "200" OK
    And Sends GET request
    And Should return "The requested resource was not found."
