*** Comments ***
Documentation
... Suite with common system features
... Resources used in all scenarios

*** Settings ***
Library     AppiumLibrary
Library     FakerLibrary    locale=pt_BR

*** Variables ***
#Android
${url}              http://localhost:4723/wd/hub
${deviceAndroid}    Android Emulator
${apk}              ${EXECDIR}/src/support/app/android.apk

#Ios
${deviceIOS}        iPhone
${app}              ${EXECDIR}/src/support/app/ios.app

# Browserstack
${userName}
${accessKey}
${appId}
${testName}

*** Keywords ***
Open App
    Set Appium Timeout    20
    IF    "${device}" == "android"    Start Android
    IF    "${device}" == "ios"    Start IOS
    IF    "${device}" == "browserstack-android"    Start Browserstack Android
    IF    "${device}" == "browserstack-ios"    Start Browserstack Ios

Close App
    Capture Page Screenshot
    Close Application

Start Android
    Open Application    ${url}
    ...    automationName=UIAutomator2
    ...    platformName=Android
    ...    deviceName=${deviceAndroid}
    ...    app=${apk}
    ...    udid=emulator-5554
    ...    autoGrantPermissions=true

Start IOS
    Open Application    ${url}
    ...    automationName=XCUITest
    ...    platformName=ios
    ...    platformVersion=16.0
    ...    deviceName=${deviceIOS}
    ...    app=${app}
    ...    udid=
    ...    autoGrantPermissions=true

Start Browserstack Android
    Set Appium Timeout    600
    Open Application    https://${userName}:${accessKey}@hub-cloud.browserstack.com/wd/hub
    ...    platformName=Android
    ...    app=${appId}
    ...    deviceName=${deviceAndroid}
    ...    device=Google Pixel 3
    ...    os_version=9.0
    ...    project=set project
    ...    build=set build
    ...    name=${testName}
    ...    autoGrantPermissions=true

Start Browserstack Ios
    Set Appium Timeout    600
    Open Application    https://${userName}:${accessKey}@hub-cloud.browserstack.com/wd/hub
    ...    automationName=XCUITest
    ...    platformName=ios
    ...    platformVersion=16.00
    ...    deviceName=${deviceIOS}
    ...    device=Iphone 13
    ...    os_version=11.0
    ...    project=set Project
    ...    build=set Build
    ...    name=${testName}
    ...    udid=
    ...    autoGrantPermissions=true