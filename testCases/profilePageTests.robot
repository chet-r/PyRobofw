*** Settings ***
Resource        ../locators/profilePageObjects.robot
Resource        ../keyWords/userDefinedKeywords.robot
Test Setup      Navigate to URL
Test Teardown   Exit browser

*** Test Cases ***
Create a new Role in the user profile page
    Login to the application
    Navigate to the user profile page
    Click on the Roles option
    Click on the New role button
    Provide a Role Name in the input box
    Click on the Save button
    Wait for Success message

Upload a new profile picture
    [Tags]  profileUpload   smoke
    Login to the application
    Navigate to the user profile page
    Click on 'Change picture' option & upload a picture
