# Test Plan: P2 - UI Test for Rudderstack App
## Test Environment
- **Testing Framework:** Webdriverio

## Feature: P2 - UI test
As a Developer in Test, I want to test if a connection exists between source and destination, and if it does not exist, create a new connection.

## Scenario: Login to Rudderstack App and Check Connection Between Source and Destination
### Preconditions:
- Test environment is set up.
- Test data (e.g., credentials) is available in the environment variables.

### Steps:
1. **Open Rudderstack App Login Page**
   - Given I open the URL "login"

2. **Provide User Credentials**
   - Given I clear the input field "#text-input-email"
   - When I add "PROD_USERNAME" from the environment to the input field "#text-input-email"
   - And I clear the input field "#text-input-password"
   - And I add "PROD_PASSWORD" from the environment to the input field "#text-input-password"

3. **Log in to Rudderstack App**
   - And I wait for the element ".ant-btn-lg" to be displayed
   - And I click on the button ".ant-btn-lg"

4. **Navigate to Connection Configuration Page**
   - And I wait for the element "[href='/addmfalater']" to be displayed
   - And I click on the button "[href='/addmfalater']"
   - And I wait for the element ".ant-btn-primary" to be displayed
   - And I click on the button ".ant-btn-primary"
   - Then I am at the Connections Page

5. **Navigate to Sources Page**
   - When I wait for the element "#source-2ZM31zPGiG1KbOi2bzZY87eS7Ow" to be displayed
   - And I click on the element "#source-2ZM31zPGiG1KbOi2bzZY87eS7Ow"
   - Then I am at the Sources Page

6. **Check Connection Status**
   - And I check if the connection is enabled or enable it if not.

### Expected Results:
- The test should successfully log in to the Rudderstack App.
- The test should navigate to the Connections Page.
- The test should navigate to the Sources Page.
- The connection status should be checked and updated if necessary.

### Notes:
- Ensure the test environment is stable and the credentials provided are valid.
- Verify that the UI elements' locators are accurate and up-to-date.
- Perform the test on different browsers if applicable.
- Update test data (e.g., credentials) as needed.

