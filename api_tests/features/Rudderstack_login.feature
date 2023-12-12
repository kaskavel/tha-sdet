Feature: Rudderstack API login tests

  In order to keep Rudderstack login functionality stable
  As a tester
  I want to make sure that everything works as expected

  Scenario: Login as a valid User
    Given I set header Content-Type to application/json
    And I set body to
      """
      {
        "email": "{{PROD_USERNAME}}",
        "password": "{{PROD_PASSWORD}}"
      }
      """
    And I make a POST request to /login
    When I receive a response
    Then I expect response should have a status 200
    And I expect response header content-type should be application/json; charset=utf-8
    And I expect response body should contain accessToken
    And I expect response body should contain idToken
    And I expect response body should contain status
    And I expect response body should contain email

  Scenario: Try Login as an invalid Username and Password
    Given I set header Content-Type to application/json
    And I set body to
      """
      {
        "email": "test",
        "password": "invalid"
      }
      """
    And I make a POST request to /login
    When I receive a response
    Then I expect response should have a status 400
    And I expect response header content-type should be application/json; charset=utf-8
    And I expect response body should contain message
    And I expect response body should contain Incorrect username or password

  Scenario: Try Login as an invalid Username
    Given I set header Content-Type to application/json
    And I set body to
      """
      {
        "email": "!",
        "password": "{{PROD_PASSWORD}}"
      }
      """
    And I make a POST request to /login
    When I receive a response
    Then I expect response should have a status 400
    And I expect response header content-type should be application/json; charset=utf-8
    And I expect response body should contain message
    And I expect response body should contain Incorrect username or password

  Scenario: Try Login as an invalid Password
    Given I set header Content-Type to application/json
    And I set body to
      """
      {
        "email": "{{PROD_USERNAME}}",
        "password": "{{@}}"
      }
      """
    And I make a POST request to /login
    When I receive a response
    Then I expect response should have a status 400
    And I expect response header content-type should be application/json; charset=utf-8
    And I expect response body should contain message
    And I expect response body should contain Incorrect username or password

  Scenario: Try Login with missing credentials
    Given I set header Content-Type to application/json
    And I make a POST request to /login
    When I receive a response
    Then I expect response should have a status 400
    And I expect response header content-type should be application/json; charset=utf-8
    And I expect response body should contain message
    And I expect response body should contain Email is missing

  Scenario: Try Login with missing password
    Given I set header Content-Type to application/json
    And I set body to
      """
      {
        "email": "{{PROD_USERNAME}}"
      }
      """
    And I make a POST request to /login
    When I receive a response
    Then I expect response should have a status 400
    And I expect response header content-type should be application/json; charset=utf-8
    And I expect response body should contain message
    And I expect response body should contain Password is missing


  Scenario: Try Login with SQL injection
    Given I set header Content-Type to application/json
    And I set body to
    """
    {
      "username": "' OR '1'='1' --",
      "password": "; DROP TABLE users --"
    }
    """
    And I make a POST request to /login
    When I receive a response
    Then I expect response should have a status 400
    And I expect response header content-type should be application/json; charset=utf-8
    And I expect response body should contain message
    And I expect response body should contain Email is missing
