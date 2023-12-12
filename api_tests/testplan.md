# Login Functionality Test Plan

## Objective
The objective of this test plan is to verify the correctness and reliability of the login functionality through API using Pactum.

## Test Environment
- **API Endpoint:** https://api.rudderstack.com/login
- **Testing Framework:** Pactum

## Test Scenarios

### 1. Positive Test Cases

#### 1.1 Successful Login
**Test Steps:**
1. Send a valid login request with correct username and password.
2. Verify that the response status code is 200.
3. Verify that the response contains a valid authentication token.
4. Verify that the user is successfully logged in.

#### 1.2 Successful Login with Token Expiry Check
**Test Steps:**
1. Perform a successful login.
2. Extract the authentication token from the response.
3. Wait for the token to expire.
4. Attempt to make a request using the expired token.
5. Verify that the response status code is 401 (Unauthorized).
6. Verify that the response contains an appropriate error message.

### 2. Negative Test Cases

#### 2.1 Invalid Username
**Test Steps:**
1. Send a login request with an invalid username.
2. Verify that the response status code is 400.
3. Verify that the response contains an appropriate error message.

#### 2.2 Invalid Password
**Test Steps:**
1. Send a login request with an invalid password.
2. Verify that the response status code is 401.
3. Verify that the response contains an appropriate error message.

#### 2.3 Missing Credentials
**Test Steps:**
1. Send a login request without providing any credentials.
2. Verify that the response status code is 400.
3. Verify that the response contains an appropriate error message.

### 3. Security Tests

#### 3.1 SQL Injection Prevention
**Test Steps:**
1. Attempt to log in with a username containing SQL injection.
2. Verify that the response status code is 401.
3. Verify that the response contains an appropriate error message.

#### 3.2 Brute Force Protection
**Test Steps:**
1. Attempt to log in multiple times with incorrect credentials.
2. Verify that after a certain number of attempts, the account is locked.
3. Verify that subsequent login attempts with correct credentials are successful.

## Conclusion
This test plan covers a range of positive, negative, and security test scenarios to ensure the robustness and security of the login functionality through the specified API endpoint using Pactum. It is recommended to perform additional tests as needed based on the specific requirements and features of the application.

