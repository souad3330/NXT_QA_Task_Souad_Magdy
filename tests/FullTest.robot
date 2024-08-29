*** Settings ***
##Resource    resources/KeywordsLibrary.robot

Resource  C:/Users/Administrator/PycharmProjects/NXT_QA_Task/resources/KeywordsLibrary.robot


Library  SeleniumLibrary


*** Test Cases ***
Create Event And Add User With Trip
    [Setup]    Open Browser  https://qa-test-frontend-ce07bae316f3.herokuapp.com/  Chrome
    Maximize Browser Window
    Login    nxttester    nxt#qA@23
    Skip  ${Skip}
    Create Event
    Setup Later

    Go To Registration
    Go To Attendees
    GO To All Visitors
    Add User
    Fill User Details    Nxt12346    will    smith    test1@test1.com
    Go To Trip Info
    Add Trip
    Set Flight Status    Approved
    [Teardown]    Close Browser
