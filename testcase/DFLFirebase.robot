*** Settings ***
Library    Selenium2Library
#Test Teardown    Close Browser

*** Variables ***
${DFLDevice_URL}    https://azay-dfl.firebaseapp.com/login    #http://localhost:4200    
${Browser}    chrome
${txt_username_locator}    //*[@id="input_login_user"]
${txt_password_locator}    //*[@id="input_login_password"]
${submit_login_locator}    //*[@id="btn_login"]
#${submit_login_tab_locator}    //button[.//text() = 'Login']
${submit_logout_locator}    //*[@id="btn_tab_logged"]
${username}    test
${password}    test
${username_1}    test1
${password_1}    test1
${width}    1800
${height}    1200

*** Keyword ***
Username Text
    [Arguments]    ${input_login_username}
    Input Text    ${txt_username_locator}    ${input_login_username}

Password Text
    [Arguments]    ${input_login_password}
    Input Text    ${txt_password_locator}    ${input_login_password}

Input Valid Username
    Username Text    ${username}
    Set Timeout 
    
Input Valid Password
    Password Text   ${password}
    Set Timeout 

Input InValid Username
    Username Text    ${username_1}
    Set Timeout 
    
Input InValid Password
    Password Text   ${password_1}
    Set Timeout 

Click Login
    Click Element    ${submit_login_locator}
    Set Timeout 

Click Logout
    Click Element    ${submit_logout_locator}
    Set Timeout 

Open Website
    Open Browser    ${DFLDevice_URL}    ${Browser}
    Set Window Size    ${width}  ${height}  
    Set Timeout 

Set Timesleep
    [Timeout]    ${timeout}
    Sleep    0.5s

Set Timesleep 2s
    [Timeout]    ${timeout}
    Sleep    1s

Set Timeout
    Set Test Variable    ${timeout}   1s
    Set Timesleep

Set Timeout 10s
    Set Test Variable    ${timeout}   10s
    Set Timesleep 2s

Set Timeout 15s
    Set Test Variable    ${timeout}   15s
    Set Timesleep 2s

*** Test Cases ***
Test_01_Login_Valid_UserName_&_Password
    Open Website
    Input Valid Username 
    Input Valid Password
    Click Login
    #Click Element    ${submit_login_tab_locator}
    Wait until page contains    Test Service Login Production
    Set Timeout 15s
    Click Logout
    Set Timeout 15s
    Close Browser

Test_02_Login_InValid_UserName
    Open Website
    Input InValid Username
    Input Valid Password
    Click Login
    Wait until page contains    Username or password is incorrect
    Set Timeout 10s
    Close Browser

Test_03_Login_InValid_Password
    Open Website
    Input Valid Username
    Input InValid Password
    Click Login
    Wait until page contains    Username or password is incorrect
    Set Timeout 10s
    Close Browser

Test_04_Login_InValid_Username_&_Password
    Open Website
    Input InValid Username
    Input InValid Password
    Click Login 
    Wait until page contains    Username or password is incorrect
    Set Timeout 10s
    Close Browser