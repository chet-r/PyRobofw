*** Settings ***
Resource        ../locators/projectPageObjects.robot
Resource        ../keyWords/userDefinedKeywords.robot
Test Setup      Navigate to URL
Test Teardown   Exit browser

*** Test Cases ***
Select the project filter status as InProgress & save
    [tags]  filter  smoke
    Login to the application
    Click on project icon
    Click on Filter button
    Input the filter 'Where'
    Input the 'is exactly' field
    Click on the 'Done' button
    Click on 'Save view as...'
    Input a name for the view
    Wait for file upload success message

Validate the file upload feature in project page
    [tags]  fileupload  smoke
    Login to the application
    Click on project icon
    Click on a project in project page
    Click on the 'All files' tab in the header
    Click on the 'Upload' button
    Upload a file from disk
    Wait for file upload success message

Validate the customization of Board tab on project page
    [tags]  projectCustomization  smoke
    Login to the application
    Click on project icon
    Click on a project in project page
    Click on the show tabs option
    Uncheck the Board option
    Verify that the board tab is removed
    Check the board option back in the menu

Create a new chat conversation without adding members
    [tags]  chat  smoke
    Login to the application
    Click on project icon
    Click on a project in project page
    Click on the 'Chat' tab in the header
    Click on 'New Conversations' button
    Enter a new conversation name & description
    Add people into conversation