Feature: P2 - UI test
    As a Developer in Test
    I want to test if a connection exists between source and destination and
    if it does not exist to create a new connection

    Scenario: login to rudderstack app and check connection between source and destination
        Given I open the url "login"
        And   I clear the inputfield "#text-input-email"
        When I add "PROD_USERNAME" from env to the inputfield "#text-input-email"
        And   I clear the inputfield "#text-input-password"
        And   I add "PROD_PASSWORD" from env to the inputfield "#text-input-password"
        And   I wait on element ".ant-btn-lg" to be displayed
        And   I click on the button ".ant-btn-lg"
        And  I wait on element "[href='/addmfalater']" to be displayed
        And   I click on the button "[href='/addmfalater']"
        And  I wait on element ".ant-btn-primary" to be displayed
        And   I click on the button ".ant-btn-primary"
        Then I am at Connections Page

        When I wait on element "#source-2ZM31zPGiG1KbOi2bzZY87eS7Ow" to be displayed
        And I click on the element "#source-2ZM31zPGiG1KbOi2bzZY87eS7Ow"
        Then I am at Sources Page
        And I check if connection is enabled or I enable it
