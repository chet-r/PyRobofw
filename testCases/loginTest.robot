*** Settings ***
Resource        ../keyWords/userDefinedKeywords.robot
Test Setup      Navigate to URL
Test Teardown   Exit browser

*** Test Cases ***
Login Test
    Login to the application


