Feature: Get user object by Id
    I want to get user object.
    Background:
        Given open http://localhost:8081/api/v1/findById

    Scenario: get user object.
        Given: user Id
        And Do send
        When Do Send
        Then return found status code
        And return user object in the body