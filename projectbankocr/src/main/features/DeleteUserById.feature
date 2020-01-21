Feature: Delete user by Id
    I want to delete a user by Id.
    Background:
        Given open http://localhost:8081/api/v1/deletebyId
        And add bearer token to header

    Scenario: delete user.
        Given: user Id
        And Do send
        When Do Send
        Then return moved permanently status code
        And return deleted user object in the body