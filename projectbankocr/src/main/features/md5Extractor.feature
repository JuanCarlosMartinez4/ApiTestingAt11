Feature: Md5 Extractor
    I want extract md5 of the uploaded file.
    Background:
        Given open http://localhost:8081/api/v1/extractMd5

    Scenario: upload image file.
        Given: upload image file
        And Do Send
        When Do send
        Then return md5 string of the uploaded file