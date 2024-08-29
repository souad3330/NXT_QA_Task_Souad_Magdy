*** Settings ***
Library    SeleniumLibrary
Library    Collections

*** Variables ***
${BROWSER}    Chrome
${URL}        https://qa-test-frontend-ce07bae316f3.herokuapp.com/
${CHROMEDRIVER_PATH}    C:\\chromedriver.exe
${Skip}  xpath=/html/body/div/div[1]/div[5]/main/div/div/form/div/div[3]/button
##${create_event_page_title}   xpath=//*[@id="root"]/div[1]/div[5]/main/div/section/div[2]/a/div/p
${create_event_button}  xpath=//*[@id="root"]/div[1]/div[5]/main/div/section/div[2]/a/div/p
${dashboard_title}  xpath=//*[@id="root"]/div[1]/div[5]/main/div/section/div[1]/div/h2
${registration_menu}  xpath=//*[@id="root"]/div[1]/div[5]/main/div[1]/aside/div/main/div[4]/div[1]/div/div[1]/span
${attendees_menu}  xpath=//*[@id="root"]/div[1]/div[5]/main/div[1]/aside/div/main/div[4]/div[2]/div/ul/li[1]/a
${add_user_button}  xpath=//*[@id="root"]/div[1]/div[5]/main/div[2]/div/section/div[2]/div/div[6]/a/div/span
${trip_info_tab}  xpath=/html/body/div/div[1]/div[5]/main/div[2]/div/form/div[2]/ul/li[2]
${add_trip_button}  xpath=//*[@id="root"]/div[1]/div[5]/main/div[2]/div/form/div[3]/div[2]/div/a/div/p
${setup_later_button}  xpath=//*[@id=\"root\"]/div[1]/div[5]/main/div/div[2]/div[3]/div/div/div
${all_visitors_tab}   xpath=//*[@id="root"]/div[1]/div[5]/main/div[2]/div/div[1]/div[2]
${firstname_locator}  id=firstName
${lastname_locator}  id=lastName
${password_locator}  id=password
${email_locator}  id=email
${create_user_button_locator}   xpath=//*[@id="root"]/div[1]/div[5]/main/div[2]/div/form/section/div[2]/div/div/div/div[2]/button
${login_btn_locator}   xpath=//*[@id="root"]/div[1]/div[5]/main/div/div/form/div/div[2]/button
${add_trip_btn_locator}  xpath=//*[@id="root"]/div[1]/div[5]/main/div[2]/div/section/div[1]/div/h2    Add Trip


*** Keywords ***
##Open Browser And Maximize
##    [Arguments]    ${URL}    ${BROWSER}
  ##  Open Browser    ${URL}    ${BROWSER}
    ##Maximize Browser Window



Login
    [Arguments]    ${username}    ${password}
    Wait Until Page Contains Element    id=username    10s
    Input Text    id=username    ${username}
    Input Text    id=password    ${password}
    Click Button    ${login_btn_locator}

Skip
    [Arguments]  ${Skip}
    Wait Until Page Contains Element  ${Skip}
    Click Button    ${Skip}

Wait For Element To Contain
    [Arguments]    ${locator}    ${text}
    Wait Until Page Contains Element    ${locator}   15s
    Wait Until Element Contains   ${locator}    ${text}

Create Event

    Wait Until Page Contains Element  ${create_event_button}
    Click Element    ${create_event_button}
    Wait For Element To Contain    ${dashboard_title}    New Event

Setup Later
  Click element   ${setup_later_button}


Go To Registration
    Wait Until Element Is Visible   ${registration_menu}
    Click Element    ${registration_menu}

Go To Attendees
    Wait Until Page Contains Element  ${attendees_menu}  10s
    Click Element    ${attendees_menu}

GO To All Visitors
    Wait Until Page Contains Element  ${all_visitors_tab}  10s
    Click Element   ${all_visitors_tab}

Add User
    Wait Until Page Contains Element  ${add_user_button}   10s
    Click Element    ${add_user_button}

Fill User Details
    [Arguments]    ${password}    ${first_name}    ${last_name}    ${email}
    Wait Until Page Contains Element   ${firstname_locator}
    Input Text    ${password_locator}    ${password}
    Input Text    ${firstname_locator}    ${first_name}
    Input Text    ${lastname_locator}    ${last_name}
    Input Text    ${email_locator}     ${email}
    Scroll Element Into View    ${create_user_button_locator}
    Click Button   ${create_user_button_locator}

Go To Trip Info
    Wait Until Page Contains Element   ${trip_info_tab}  10
    ##Wait Until Element Is Visible   ${trip_info_tab}   15
    ##Scroll Element Into View   ${trip_info_tab}
    Wait Until Element Is Enabled    ${trip_info_tab}

    Click Element    ${trip_info_tab}

Add Trip
    Wait For Element To Contain    ${add_trip_btn_locator}
    Click Element    ${add_trip_button}

Set Flight Status
    [Arguments]    ${status}
    Select From List By Value    id=status_trip    ${status}

Close Browser
    Close Browser
