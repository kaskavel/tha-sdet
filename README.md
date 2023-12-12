# tha-sdet

Test repo set-up for testing aspects of rudderstack's frontend and APIs. 

The tests have been developed on top of MacOS v11.6.8, with node version v20.10.0 and npm version 10.2.3. 

All pre-requisites are defined in the package.json of api_tests and e2e_tests directories and a  `npm install ` 
under each of those directories would install the required modules. 

The two directories are treated as if they were completely separable from each other. 
The boilerplate code for webdriverio and pactumJS has been incorporated within this project, with some 
extra functionality being added to serve the testing scope of this exercise.  

## UI tests

Under e2e_tests directory, run: 

```sh
npm run test:features
```

Notes: Some locators were used as part of the e2e test as a means of last resort due to the lack of a better locator. 
Some explicit waits were also added to remove any flakiness of the test that could have been handled implicitly. 
Normally .env files would not be committed with real passwords and these would be kept as github secrets for CI purposes.

## API tests 

Under api_tests directory, run: 

```sh
npm run test
```

Notes: You may find more API tests description in the testplan, but not all tests described there were materialized, 
mainly because they would use more or less the same approach as the ones presented here and for the purpose of this 
exercise there is a limited benefit in expanding the scope of testing. SQL injection tests have been kept to an 
absolute minimum since this is against a prod environment. Follow-up API tests using the bearer tokens would be straight 
forward to implement. 


## Comments

There was a deliberate effort not to over-engineer any parts of this exercise and to stick to the basic requirements, 
taking in mind the cost/benefit ratio and time constraints. 

Some ideas for enhancements include: 

- Add integration with better reporting
- Offer the capability to run the test in a dockerised mode
- Modularize the code more
- Use Page Object Model for the UI tests
- Implement some github workflows at root level 
