*** Settings ***
Library     SeleniumLibrary
Library    String
Variables    ../resources/environment.py

*** Variables ***
${PROFILE_HEADER}               xpath://div//h5[contains(text(),'Settings')]
${ROLES_OPTION}                 xpath://span[contains(text(),'Roles')]
${ROLES_TABLE_ROW_START}        xpath://div[@class='ag-center-cols-container']//div[@row-index='0']
${ROLES_TABLE_ROW_END}          xpath://div[@class='ag-center-cols-container']//div[@class='ag-row ag-row-no-focus ag-row-odd ag-row-level-0 ag-row-position-absolute ag-row-last']
${ROLES_TABLE_ROW_END_TEXT}     xpath://div[@class='ag-center-cols-container']//div[@class='ag-row ag-row-no-focus ag-row-odd ag-row-level-0 ag-row-position-absolute ag-row-last']/div[1]
${NEW_ROLE_BUTTON}              xpath://button[contains(text(),'New role')]
${ROLE_NAME_INPUT}              xpath://div[@class='ant-drawer-body']//input[@placeholder='E.g. CSM 1']
${ROLE_SAVE_BTN}                xpath://div[@class='ant-drawer-footer']//button[contains(text(),'Save')]
${ROLE_CREATE_SUCCESS}          xpath://div[@class='ant-notification ant-notification-bottomLeft']//div[@class='ant-notification-notice ant-notification-notice-closable']
${UPLOAD_STATUS}                xpath://div[@class='ant-notification ant-notification-bottomLeft']//div[@class='ant-notification-notice ant-notification-notice-closable']
${PROFILE_OPTION}               xpath:xpath://span[contains(text(),'Profile')]
${PROFILE_TEXT}                 xpath://div//h4[contains(text(),'Profile')]
${PROFILE_PIC_UPLOAD}           xpath://input[@type='file' and @accept='image/png, image/jpeg, image/jpg']

*** Keywords ***
Navigate to the user profile page
    Go To    ${URL}/settings/profile
    Wait Until Element Is Visible    ${PROFILE_HEADER}

Click on the Roles option
    Click Element                    ${ROLES_OPTION}
    Wait Until Element Is Visible    ${ROLES_TABLE_ROW_START}

Click on the New role button
    Click Element    ${NEW_ROLE_BUTTON}
    Wait Until Element Is Visible    ${ROLE_NAME_INPUT}

Provide a Role Name in the input box
    ${rndTxt}     Generate Random String
    Input Text    ${ROLE_NAME_INPUT}    ${rndTxt}
    
Click on the Save button
    Wait Until Element Is Visible    ${ROLE_SAVE_BTN}
    Click Element                    ${ROLE_SAVE_BTN}

Wait for Success message
    Wait Until Element Is Visible        ${ROLE_CREATE_SUCCESS}
    Wait Until Element Is Not Visible    ${ROLE_CREATE_SUCCESS}

Click on 'Change picture' option & upload a picture
    Choose File         ${PROFILE_PIC_UPLOAD}    ${EXECDIR}\\resources\\letterD.png
    Wait Until Element Is Visible    ${UPLOAD_STATUS}   60






