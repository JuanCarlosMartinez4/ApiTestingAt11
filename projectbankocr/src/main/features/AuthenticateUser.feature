Feature: Login user
    I want login a user in the application.
    Background:
        Given open http://localhost:8081/api/v1/login

    Scenario: login user with userName and password.
        Given: userName
        And password
        When Do Send
        Then return accepted status code
        And return int the body token generated