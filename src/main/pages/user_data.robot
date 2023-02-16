*** Comments ***
Documentation
... Suite with login variables

*** Settings ***
Resource    ../support/base.robot

*** Variables ***
${userDataVariable}            userDataVariable

*** Keywords ***

Define keywords
    Wait Until Element Is Visible        ${userDataVariable}