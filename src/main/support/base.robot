*** Comments ***
Documentation
... Suite with base system features
... Resources used in all scenarios

*** Settings ***
Resource    commom-resources.robot

*** Variables ***
#primeiro xpath sempre ios usando o * para nao ter problemas, segundo sempre android pode ser usado qualquer elemento
${doubleXpath}          //*[@name='nameTitleLabel' or @text='E-mail ou CPF']
${emailTextField}       //*[@name='nameTitleLabel' or @text='E-mail ou CPF']
${passwordTextfield}    //*[@name='nameTitleLabel' or @text='E-mail ou CPF']
${submit}               //*[@name='nameTitleLabel' or @text='E-mail ou CPF']


*** Keywords ***
Given im on the app
    Wait Until Element Is Visible    ${doubleXpath}

Fill in Login
    [Arguments]    ${email}    ${password}
    Wait Until Element Is Visible    ${emailTextField}
    Input Text    ${emailTextField}    ${email}
    Input Text    ${passwordTextfield}    ${password}
    Click Element    ${submit}

# Filling login
# Quando inserir dados validos
    # Run Keyword    Fill in Login    ${emailTextfield}    ${email}    ${password}

Fill in Registration
    [Arguments]    ${firstNameTextField}    ${firstName}    ${lastNameTextField}    ${lastName}    ${emailTextField}    ${email}    ${passwordTextField}    ${password}    ${registerButton}
    Wait Until Element Is Visible    ${firstNameTextField}
    Input Text    ${firstNameTextField}    ${firstName}
    Input Text    ${lastNameTextField}    ${lastName}
    Input Text    ${emailTextField}    ${email}
    Input Text    ${passwordTextField}    ${password}
    Click Element    ${registerButton}

# Filling Registration
# Quando inserir dados validos no cadastro
#    ${firstName}    FakerLibrary.Name
#    ${lastName}    FakerLibrary.Name
#    ${email}    FakerLibrary.Email
#    ${password}    FakerLibrary.Password
#    Run Keyword    Fill in registration    ${firstNameTextField}    ${firstName}    ${lastNameTextField}    ${lastName}    ${emailTextField}    ${email}    ${passwordTextField}    ${password}    ${registerButton}

Validate and Input Text
    [Arguments]    ${locator}    ${string}
    Wait Until Element Is Visible    ${locator}    30
    Input Text    ${locator}    ${string}

# Validating and typing texts
    # Validate And Input Text    ${emailTextfield}    teste
    # Validate And Input Text    ${passwordTextfield}    teste

Validate and Click Button
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}    30
    Click Element    ${locator}

# Validating and Click Button
    # Validate And Click Button    ${submit}

Inspect if Text Exists and Confirm
    [Arguments]    ${text}
    FOR    ${index}    IN RANGE    1
        ${checkElement}=    Run Keyword and Return Status    Wait Until Page Contains    ${text}
        LOG    ${checkElement}
        IF    ${checkElement} == True
            Click Text    ${text}
        ELSE
            Wait Until Page Contains    ${text}
        END
    END

Inspect if Element Exists and Confirm
    [Arguments]    ${locator}    ${elementVisible}
    FOR    ${index}    IN RANGE    5
        ${checkElement}=    Run Keyword and Return Status    Wait Until Page Contains Element    ${locator}
        LOG    ${checkElement}
        IF    ${checkElement} == True
            Click Element    ${locator}
            Click Element    ${elementVisible}
            Sleep    2
            Click Element    ${locator}
            Sleep    2
        ELSE
            Page Should Contain Text    Você ainda não tem cadastro
        END
    END

Swipe Until Element is Visible
    [Arguments]    ${element}
    FOR    ${i}    IN RANGE    400
        ${Result}=    Run KeyWord And Return Status    Element Should Be Visible    ${element}
        IF    ${Result}    BREAK
        Swipe    700    1300    700    300
    END
