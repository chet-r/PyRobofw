*** Settings ***
Library         String
Variables       ../resources/environment.py
Resource        ../resources/testSetup.resource
Resource        ../locators/loginPageObjects.robot

*** Keywords ***
[Documentation] Keyword to login to the application
Login to the application
    Input username
    Input pwd
    Click on sign-in

