*** Settings ***
Library     SeleniumLibrary
Library     OperatingSystem
Library     String

*** Variables ***
${PROJECT_ICON}             xpath://a[@href='/projects']
${PROJECT_NAME_ROW}         xpath:(//div[@row-index='0'])[1]
${FILTER_BUTTON}            xpath://button[@type='button']/span[contains(text(),'Filter')]
${FILTER_INPUT}             xpath://div[@class='filter__FilterBoxWrapper-ciATZv ggqIX']//input[@type='search']
${FILTER_STATUS_OPTION}     xpath://div[@class='ant-select-item-option-content']//span[@title='status']
${FILTER_EXACTLY}           xpath://button[@type='button']//span[contains(text(),'Select…')]
${FILTER_EXACTLY_SEARCH}    xpath://div[@class='ant-dropdown ant-dropdown-placement-bottomLeft']//input
${FILTER_EXACTLY_OPTIONS}   xpath://div[@class='ant-dropdown ant-dropdown-placement-bottomLeft ']//div//span[contains(text(),'In progress')]
${INPUT_IS_EXACTLY}         xpath://div[@class='ant-dropdown ant-dropdown-placement-bottomLeft ']//div[@class='select__StyledControl-bqNKSl dJvPgI ozone-select__control ozone-select__control--menu-is-open css-e56m7-control']//input
${FILTER_DONE_BUTTON}       xpath://button[@type='button']//span[contains(text(),'Done')]
${SAVE_VIEW_AS_BUTTON}      xpath://button[contains(text(),'Save view as…')]
${NEW_VIEW_INPUT}           xpath://div[@class='ant-modal-content']//input[@id='viewName']
${NEW_VIEW_SAVE_BUTTON}     xpath://div[@class='ant-modal-content']//button[contains(text(),'Save')]
${VIEWS_LIST}               xpath://button[@class='ant-btn ant-btn-link ant-btn-sm button__Button-fUMwTJ components__HoverableLinkButton-dFActf ezcHOa dWWmqp']
${SUCCESS_MESSAGE}          xpath://div[@class='ant-notification-notice ant-notification-notice-closable']//div[contains(text(),'Success')]
${SEARCH_VIEWS}             xpath://div[@class='sider__SideBarWrapper-TWgKN aGCUi']//div[@class='components__SearchInput-exwHwy crgOBe']/input
${VIEW_NAME_GET}            xpath:(//button[@type='button'])[3]
${RESULT_TEXT}              xpath://div[@class='sider__SideBarWrapper-TWgKN aGCUi']//div[@class='components__Content-foxLDJ hJnyo']//ul//ul
${GROUP_BY}                 xpath://button[@type='button']//div/strong[contains(text(),'None')]
${GROUP_BY_STATUS}          xpath://div[@class='ant-dropdown ant-dropdown-placement-bottomLeft ']//li[contains(text(),'Status')]
${NEW_PROJECT_BUTTON}       xpath://button[@class='ant-btn ant-btn-primary ant-btn-sm button__Button-fUMwTJ idjSKV']
${PROJECT_ROW}              xpath:(//div[@row-index='0'])[1]
${ALL_FILES_TAB}            xpath://li[@data-test-id='project-Files-tab']
${BOARD_TAB}                xpath://li[@data-test-id='project-TaskBoard-tab']
${SHOW_TABS_OPTION}         xpath://li[@class='ant-menu-submenu ant-menu-submenu-horizontal tabsstyles__CompactExpandMenu-OEqXb coGsou']/div[@role='button']
${CHAT_TAB}                 xpath://li[@data-test-id='project-Chat-tab']
${NEW_CONVERSATION}         xpath://button[contains(text(),'New Conversation')]
${CONVERSATION_NAME_INPUT}  xpath://div[@role='document']//input[@id='newConversationForm_conversationName']
${CONVERSATION_DESC}        xpath://div[@role='document']//textarea[@id='newConversationForm_conversationDescription']
${ADD_PEOPLE_CONVO}         xpath:(//div[@role='document'])[2]//button[contains(text(),'Done')]
${CONVERSATION_CREATE}      xpath://div[@role='document']//button[contains(text(),'Create')]
${UPLOAD_BUTTON}            xpath://button[@data-cy='upload']
${FILE_GROUP_DROPDOWN}      xpath://div[@role='document']//div[@id='group']
${FILE_UPLOAD_INPUT}        xpath://input[@type='file']
${FILE_UPLOAD_BUTTON}       xpath://div[@role='document']//button[contains(text(),'Upload')]
${FILE_UPLOAD_SUCCESS}      xpath://div[@class='ant-notification ant-notification-bottomLeft']//div[@class='ant-notification-notice ant-notification-notice-closable']

*** Keywords ***
Click on project icon
    Click Element                    ${PROJECT_ICON}
    Wait Until Element Is Visible    ${PROJECT_NAME_ROW}    10

Click on Filter button
    Click Element    ${FILTER_BUTTON}

Input the filter 'Where'
    Click Element    ${FILTER_INPUT}
    Input Text       ${FILTER_INPUT}    Status
    Click Element    ${FILTER_STATUS_OPTION}

Input the 'is exactly' field
    Click Element                    ${FILTER_EXACTLY}
    Wait Until Element Is Visible    ${FILTER_EXACTLY_OPTIONS}
    Press Keys                       None    in
    Click Element                    ${FILTER_EXACTLY_OPTIONS}
    
Click on the 'Done' button
    Click Element    ${FILTER_DONE_BUTTON}

Click on 'Save view as...'
    Click Element    ${SAVE_VIEW_AS_BUTTON}

Input a name for the view
    ${randomString}     Generate Random String
    Log To Console      ${randomString}
    Input Text          ${NEW_VIEW_INPUT}     ${randomString}
    Click Element       ${NEW_VIEW_SAVE_BUTTON}

Click on a project in project page
    Click Element    ${PROJECT_NAME_ROW}

Click on the 'All files' tab in the header
    Wait Until Element Is Visible    ${ALL_FILES_TAB}
    Click Element                    ${ALL_FILES_TAB}

Click on the 'Upload' button
    Wait Until Element Is Visible    ${UPLOAD_BUTTON}
    Click Element                    ${UPLOAD_BUTTON}

Upload a file from disk
    Wait Until Element Is Visible   ${FILE_GROUP_DROPDOWN}
    Click Element                   ${FILE_GROUP_DROPDOWN}
    Press Keys                      None   RETURN
    Log To Console                  ${EXECDIR}\\resources\\err15.png
    Choose File                     ${FILE_UPLOAD_INPUT}    ${EXECDIR}\\resources\\err15.png
    Click Element                   ${FILE_UPLOAD_BUTTON}

Wait for file upload success message
    Wait Until Element Is Visible        ${FILE_UPLOAD_SUCCESS}     50

Click on the show tabs option
    Wait Until Element Is Visible        ${SHOW_TABS_OPTION}
    Mouse Over                           ${SHOW_TABS_OPTION}

Uncheck the Board option
    Execute Javascript                   document.getElementsByTagName('input')[5].click()

Verify that the board tab is removed
    Wait Until Element Is Not Visible    ${BOARD_TAB}

Check the board option back in the menu
    Wait Until Element Is Visible        ${SHOW_TABS_OPTION}
    Mouse Over                           ${SHOW_TABS_OPTION}
    Execute Javascript                   document.getElementsByTagName('input')[5].click()

Click on the 'Chat' tab in the header
    Wait Until Element Is Visible    ${CHAT_TAB}
    Click Element                    ${CHAT_TAB}

Click on 'New Conversations' button
    Wait Until Element Is Visible    ${NEW_CONVERSATION}
    Click Element                    ${NEW_CONVERSATION}

Enter a new conversation name & description
    ${rnd}  Generate Random String
    Wait Until Element Is Visible    ${CONVERSATION_NAME_INPUT}
    Input Text                       ${CONVERSATION_NAME_INPUT}    ${rnd}
    Input Text                       ${CONVERSATION_DESC}          ${rnd}
    Click Element                    ${CONVERSATION_CREATE}

Add people into conversation
    Wait Until Element Is Visible    ${ADD_PEOPLE_CONVO}
    Click Element                    ${ADD_PEOPLE_CONVO}

















