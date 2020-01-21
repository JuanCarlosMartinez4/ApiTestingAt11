Feature: Update user
    I want to update a user values by Id.
    Background:
        Given open http://localhost:8081/api/v1/updateUser
        And add bearer token to header

    Scenario: update user values by Id.
        Given: user's id
        And userName new value
        And password new value
        And rol new value
        And email new value
        When Do Send
        Then return ok status code
        And return object modified