*** Settings ***
Library  RequestsLibrary
Library  Collections
Library  ListenerLibrary


*** Test Cases ***

Quick Get Request Test-11
    [Tags]  Q-11
    Register Start Test Listener    Log     Message from start test listener
    Create Session    google  http://www.google.com
    ${response}=    GET  https://www.google.com

#Quick Get Request With Parameters Test
#    [Tags]  q-2
#    Register Start Test Listener    Log     Message from start test listener
#    Create Session    google  http://www.google.com
#    ${resp_google}=   GET On Session  google  /  expected_status=200
#
#    Should Be Equal As Strings          ${resp_google.reason}  OK
#
#Quick Get A JSON Body Test
#    [Tags]  Q-3
#    Register Start Test Listener    Log     Message from start test listener
#    ${response}=    GET  https://jsonplaceholder.typicode.com/posts/1
#    Should Be Equal As Strings    1  ${response.json()}[id]
#
#Initializing the test case
#    [Tags]  q-4
#    Register Start Test Listener    Log     Message from start test listener
#    Set To Dictionary    ${info}   field1=A sample string

*** Variables ***
&{info}