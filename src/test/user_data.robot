*** Comments ***
Documentation
...Suite with registration tests
*** Comments ***
Documentation
...suite with logged out user test

*** Settings ***
Resource            ../main/support/base.robot
Resource            ../main/pages/user_data.robot

Test Setup          Open App
Test Teardown       Close App

*** Test Cases ***
Test Case 001: name of test
    Given im on the app