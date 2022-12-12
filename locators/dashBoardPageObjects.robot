*** Settings ***
Library     SeleniumLibrary
Library     String
Variables   ../resources/environment.py

*** Variables ***
${DASHBOARD_MESSAGE}            xpath://div[contains(text(),'Start building your dashboard!')]
${NEW_DASHBOARD}                xpath://button[contains(text(),'New dashboard')]
${DASHBOARD_NAME}               xpath://div[@role='document']//input[@id='dashboardName']
${CREATE_BUTTON}                xpath://div[@role='document']//button[contains(text(),'Create')]
${DASHBOARD_SUCCESS_MESSAGE}    xpath://div[@class='ant-notification ant-notification-bottomLeft']//div[@class='ant-notification-notice ant-notification-notice-closable']


*** Keywords ***
Navigate to the dashboard page
    Go To    ${URL}/dashboards
    Wait Until Element Is Visible    ${DASHBOARD_MESSAGE}
    
Click on create new dashboard
    Wait Until Element Is Visible    ${NEW_DASHBOARD}
    Click Element    ${NEW_DASHBOARD}
    
Enter the new dashboard name
    Wait Until Element Is Visible    ${DASHBOARD_NAME}
    ${rndString}    Generate Random String
    Input Text    ${DASHBOARD_NAME}     ${rndString}
    
Click on create button
    Click Element    ${CREATE_BUTTON}
    
Wait for success message
    Wait Until Element Is Visible    ${DASHBOARD_SUCCESS_MESSAGE}
    

