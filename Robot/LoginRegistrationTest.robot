*** Settings ***
Documentation    Simple resource file for basic login/registration testing

Library          SeleniumLibrary

*** Variables ***
${URL}              http://localhost:8000
${BROWSER}          Edge
${USERNAME}         testone
${PASSWORD}         testpass123
${EMAIL}            testone@example.com

*** Keywords ***
Go to Website
    [Documentation]    Open browser and go to website
    Open Browser    ${URL}    ${BROWSER}
    Set Selenium Speed    0.2 seconds
    Maximize Browser Window

Go To Staff Signup Page
    [Documentation]    Navigate to staff signup page
    Go To    ${URL}/staffsignup/
    Page Should Contain    STAFF SIGNUP

Register New User
    [Documentation]    Fill and submit registration form
    Wait Until Element Is Visible    name=uname    timeout=5s
    Input Text    name=uname    ${USERNAME}
    Input Text    name=fname    Test
    Input Text    name=lname    User
    Input Text    name=email    ${EMAIL}
    Input Text    name=phone    1234567890
    Input Text    name=password    ${PASSWORD}
    Click Button    xpath=//input[@value='Create']

Verify Registration Success
    [Documentation]    Check for registration success by verifying redirect to login page
    Wait Until Location Contains    stafflogin    timeout=8s
    Wait Until Page Contains    Staff Login    timeout=5s

Go To Staff Login Page
    [Documentation]    Navigate to staff login page
    Go To    ${URL}/stafflogin/
    Page Should Contain    Staff Login

Login With Credentials
    [Documentation]    Enter login credentials and submit
    Wait Until Element Is Visible    name=loginuname    timeout=5s
    Clear Element Text    name=loginuname
    Input Text    name=loginuname    ${USERNAME}
    Clear Element Text    name=loginpassword
    Input Text    name=loginpassword    ${PASSWORD}
    Click Button    xpath=//input[@value='Login']

Verify Login Success
    [Documentation]    Check if login was successful
    Wait Until Location Contains    dashboard    timeout=8s
    Wait Until Page Contains    Dashboard    timeout=5s

