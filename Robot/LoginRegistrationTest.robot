*** Settings ***
Documentation    Login and Registration Tests by Amrit Niure (s396426)

Library          SeleniumLibrary

*** Variables ***
${URL}              http://localhost:8000
${BROWSER}          Edge
${USERNAME}         fslkfjksl
${PASSWORD}         testpass123
${EMAIL}            fslkfjksl@example.com

*** Keywords ***
Go to Website
    [Documentation]    Open browser and go to website
    Open Browser    ${URL}    ${BROWSER}
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

# Keywords for Empty Field Tests
Register User With Empty Field
    [Arguments]    ${field_type}
    [Documentation]    Register with one empty field
    Wait Until Element Is Visible    name=uname    timeout=5s
    Run Keyword If    '${field_type}' == 'username'    Input Text    name=uname    ${EMPTY}
    ...    ELSE    Input Text    name=uname    testuser_empty
    Input Text    name=fname    Test
    Input Text    name=lname    User
    Run Keyword If    '${field_type}' == 'email'    Input Text    name=email    ${EMPTY}
    ...    ELSE    Input Text    name=email    test_empty@example.com
    Input Text    name=phone    1234567890
    Run Keyword If    '${field_type}' == 'password'    Input Text    name=password    ${EMPTY}
    ...    ELSE    Input Text    name=password    testpass123
    Click Button    xpath=//input[@value='Create']
    Sleep    1s

Login With Empty Field
    [Arguments]    ${field_type}
    [Documentation]    Login with empty field(s)
    Wait Until Element Is Visible    name=loginuname    timeout=5s
    Run Keyword If    '${field_type}' == 'username' or '${field_type}' == 'both'    Input Text    name=loginuname    ${EMPTY}
    ...    ELSE    Input Text    name=loginuname    ${USERNAME}
    Run Keyword If    '${field_type}' == 'password' or '${field_type}' == 'both'    Input Text    name=loginpassword    ${EMPTY}
    ...    ELSE    Input Text    name=loginpassword    ${PASSWORD}
    Click Button    xpath=//input[@value='Login']
    Sleep    1s

Verify Registration Fails
    [Documentation]    Verify that registration did not succeed and capture screenshot
    Capture Page Screenshot    registration_failure_{index}.png
    ${current_url}=    Get Location
    Should Not Contain    ${current_url}    dashboard
    Should Not Contain    ${current_url}    stafflogin

Verify Login Fails
    [Documentation]    Verify that login did not succeed and capture screenshot
    Capture Page Screenshot    login_failure_{index}.png
    ${current_url}=    Get Location
    Should Not Contain    ${current_url}    dashboard

# Keywords for Special Characters Tests
Register User With Special Chars
    [Arguments]    ${field_type}    ${special_value}
    [Documentation]    Register with special characters in specified field
    Wait Until Element Is Visible    name=uname    timeout=5s
    Run Keyword If    '${field_type}' == 'username'    Input Text    name=uname    ${special_value}
    ...    ELSE    Input Text    name=uname    testuser_special_${special_value}
    Input Text    name=fname    Test
    Input Text    name=lname    User
    Run Keyword If    '${field_type}' == 'email'    Input Text    name=email    ${special_value}
    ...    ELSE    Input Text    name=email    testspecial_${special_value}@example.com
    Input Text    name=phone    1234567890
    Input Text    name=password    testpass123
    Click Button    xpath=//input[@value='Create']
    Sleep    1s

Login With Special Chars
    [Arguments]    ${username}    ${password}
    [Documentation]    Login with special characters
    Wait Until Element Is Visible    name=loginuname    timeout=5s
    Input Text    name=loginuname    ${username}
    Input Text    name=loginpassword    ${password}
    Click Button    xpath=//input[@value='Login']
    Sleep    1s

Verify Registration Behavior
    [Documentation]    Verify registration behavior and capture screenshot
    Capture Page Screenshot    registration_behavior_{index}.png
    ${current_url}=    Get Location
    Log    Current URL: ${current_url}

# Keywords for Edge Case Tests
Register User With Long Input
    [Arguments]    ${field_type}    ${long_value}
    [Documentation]    Register with very long input in specified field
    Wait Until Element Is Visible    name=uname    timeout=5s
    Run Keyword If    '${field_type}' == 'username'    Input Text    name=uname    ${long_value}
    ...    ELSE    Input Text    name=uname    testuser_long
    Input Text    name=fname    Test
    Input Text    name=lname    User
    Run Keyword If    '${field_type}' == 'email'    Input Text    name=email    ${long_value}
    ...    ELSE    Input Text    name=email    testlong@example.com
    Input Text    name=phone    1234567890
    Input Text    name=password    testpass123
    Click Button    xpath=//input[@value='Create']
    Sleep    1s

Register User With Short Input
    [Arguments]    ${uname}    ${fname}    ${lname}    ${email}    ${phone}    ${password}
    [Documentation]    Register with minimum length inputs
    Wait Until Element Is Visible    name=uname    timeout=5s
    Input Text    name=uname    ${uname}
    Input Text    name=fname    ${fname}
    Input Text    name=lname    ${lname}
    Input Text    name=email    ${email}
    Input Text    name=phone    ${phone}
    Input Text    name=password    ${password}
    Click Button    xpath=//input[@value='Create']
    Sleep    1s

Register User With Invalid Email
    [Arguments]    ${invalid_email}
    [Documentation]    Register with invalid email format
    Wait Until Element Is Visible    name=uname    timeout=5s
    Input Text    name=uname    testuser_invalidemail
    Input Text    name=fname    Test
    Input Text    name=lname    User
    Input Text    name=email    ${invalid_email}
    Input Text    name=phone    1234567890
    Input Text    name=password    testpass123
    Click Button    xpath=//input[@value='Create']
    Sleep    1s

Register User With Invalid Phone
    [Arguments]    ${invalid_phone}
    [Documentation]    Register with invalid phone number
    Wait Until Element Is Visible    name=uname    timeout=5s
    Input Text    name=uname    testuser_invalidphone
    Input Text    name=fname    Test
    Input Text    name=lname    User
    Input Text    name=email    testinvalidphone@example.com
    Input Text    name=phone    ${invalid_phone}
    Input Text    name=password    testpass123
    Click Button    xpath=//input[@value='Create']
    Sleep    1s

Login With Wrong Credentials
    [Arguments]    ${username}    ${password}
    [Documentation]    Login with incorrect credentials
    Wait Until Element Is Visible    name=loginuname    timeout=5s
    Input Text    name=loginuname    ${username}
    Input Text    name=loginpassword    ${password}
    Click Button    xpath=//input[@value='Login']
    Sleep    1s

# Keywords for Duplicate Tests
Register Duplicate User
    [Arguments]    ${duplicate_field}
    [Documentation]    Register with duplicate username or email
    Wait Until Element Is Visible    name=uname    timeout=5s
    Run Keyword If    '${duplicate_field}' == 'username'    Input Text    name=uname    ${USERNAME}
    ...    ELSE    Input Text    name=uname    testuser_dup_${duplicate_field}
    Input Text    name=fname    Test
    Input Text    name=lname    Duplicate
    Run Keyword If    '${duplicate_field}' == 'email'    Input Text    name=email    ${EMAIL}
    ...    ELSE    Input Text    name=email    testdup_${duplicate_field}@example.com
    Input Text    name=phone    9876543210
    Input Text    name=password    testpass456
    Click Button    xpath=//input[@value='Create']
    Sleep    1s

Verify Duplicate Registration Fails
    [Documentation]    Verify that duplicate registration is rejected and capture screenshot
    Capture Page Screenshot    duplicate_registration_{index}.png
    ${current_url}=    Get Location
    # Should either stay on signup page or show error
    Run Keyword And Ignore Error    Page Should Contain    already exists
    Should Not Contain    ${current_url}    dashboard

# Keywords for Additional Edge Cases
Register User With Whitespace
    [Arguments]    ${username_ws}    ${email_ws}
    [Documentation]    Register with whitespace in fields
    Wait Until Element Is Visible    name=uname    timeout=5s
    Input Text    name=uname    ${username_ws}
    Input Text    name=fname    Test
    Input Text    name=lname    User
    Input Text    name=email    ${email_ws}
    Input Text    name=phone    1234567890
    Input Text    name=password    testpass123
    Click Button    xpath=//input[@value='Create']
    Sleep    1s

Register User With Space Password
    [Documentation]    Register with password containing only spaces
    Wait Until Element Is Visible    name=uname    timeout=5s
    Input Text    name=uname    testuser_spacepass
    Input Text    name=fname    Test
    Input Text    name=lname    User
    Input Text    name=email    testspacepass@example.com
    Input Text    name=phone    1234567890
    Input Text    name=password    ${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}
    Click Button    xpath=//input[@value='Create']
    Sleep    1s

Login With Different Case
    [Arguments]    ${username}    ${password}
    [Documentation]    Login with different case username
    Wait Until Element Is Visible    name=loginuname    timeout=5s
    Input Text    name=loginuname    ${username}
    Input Text    name=loginpassword    ${password}
    Click Button    xpath=//input[@value='Login']
    Sleep    1s

Verify Login Behavior
    [Documentation]    Verify login behavior and capture screenshot
    Capture Page Screenshot    login_behavior_{index}.png
    ${current_url}=    Get Location
    Log    Current URL: ${current_url}


