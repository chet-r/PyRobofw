*** Settings ***
Library         SeleniumLibrary
Variables       ../resources/environment.py
Resource        ../resources/testSetup.resource

*** Variables ***
${EMAIL_INPUT}      id:okta-signin-username
${PASSWORD_INPUT}   id:okta-signin-password
${SUBMIT}           id:okta-signin-submit
${LOGO}             xpath://div[@class='left-navstyle__Logo-hGHvAC gMmKyQ']

*** Keywords ***
Input username
    Wait Until Element Is Visible    ${EMAIL_INPUT}
    Input Text          ${EMAIL_INPUT}     ${EMAIL}

Input pwd
    Input Text          ${PASSWORD_INPUT}  ${PASSWORD}

Click on sign-in
    Click Element       ${SUBMIT}
    Wait Until Element Is Visible    ${LOGO}    15
    ${title}    Get Title
    Log To Console    ${title}
