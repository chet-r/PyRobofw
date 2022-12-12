*** Settings ***
Library         SeleniumLibrary
Variables       ../resources/environment.py

*** Keywords ***
Navigate to URL
    Open Browser    ${URL}      ${BROWSER}
    Maximize Browser Window

Exit browser
    Close Browser