Feature: Download zip file
    I want to download zip file.
    Background:
        Given open http://localhost:8081/api/v1/download/

    Scenario: download file.
        Given: link generated
        And Do send
        When Do Send
        Then return ok status code
        And start to download file