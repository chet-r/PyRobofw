*** Settings ***
Library     SeleniumLibrary
Library     String

*** Variables ***
${NEW_TASK_BUTTON}          xpath://button[@class='ant-btn ant-btn-primary ant-btn-sm button__Button-fUMwTJ idjSKV']
${TASK_NAME}                xpath://div[@class='ant-modal-content']//textarea[@placeholder='Task name']
${CHOOSE_BUTTON}            xpath://div[@class='ant-modal-content']//button[contains(text(),'Choose...')]

*** Keywords ***
Navigate to home page
    Press Keys      None    H
    Wait Until Element Is Visible    ${NEW_TASK_BUTTON}

Click on new task button
    Click Element    ${NEW_TASK_BUTTON}

Enter a new task name
    ${rndString}    Generate Random String
    Input Text    ${TASK_NAME}    ${rndString}
    Execute Javascript      document.getElementsByClassName('ant-btn ant-btn-link button__Button-fUMwTJ kpmCzk styled__Popover-hkFRMn jySpsm')[0].click()
    Sleep    10
