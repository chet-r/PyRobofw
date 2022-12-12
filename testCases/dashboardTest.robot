*** Settings ***
Resource    ../locators/dashBoardPageObjects.robot
Resource    ../keyWords/userDefinedKeywords.robot
Test Setup      Navigate to URL
Test Teardown   Exit browser


*** Test Cases ***
dashboard test
    Login to the application
    Navigate to the dashboard page
    Click on create new dashboard
    Enter the new dashboard name
    Click on create button
    Wait for success message