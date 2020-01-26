# Created by Admin at 1/24/2020
Feature: # Post board in trello
  # Posts board in trello api
  Background:
    Given Sets URL "https://api.trello.com/1/boards/"
    And Sets KEY "keyValue"
    And Sets TOKEN "tokenValue"

  Scenario: # Creates a new board in Trello
    Given Sets name "boardTest"
    When Sends POST request
    Then Should return status code "200" OK
    And Sends DELETE request
    And Should return status code "200" OK
    And Sends GET request
    And Should return "The requested resource was not found."